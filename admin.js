function loadRoutes() {
  fetch("admin_api.jsp?action=getRoutes")
    .then(res => res.json())
    .then(data => {
      if (!data.length) {
        document.getElementById("routeTable").innerHTML =
          "<p>No routes found. Add one above.</p>";
        return;
      }

      let html = `<table>
        <tr><th>ID</th><th>Name</th><th>Origin</th><th>Destination</th><th>Distance</th><th>Action</th></tr>`;
      data.forEach(r => {
        html += `<tr>
          <td>${r.route_id}</td>
          <td>${r.route_name}</td>
          <td>${r.origin}</td>
          <td>${r.destination}</td>
          <td>${r.distance_km} km</td>
          <td><button onclick="deleteRoute(${r.route_id})">🗑️</button></td>
        </tr>`;
      });
      html += "</table>";
      document.getElementById("routeTable").innerHTML = html;
    })
    .catch(err => {
      console.error("Error loading routes:", err);
      document.getElementById("routeTable").innerHTML =
        "<p style='color:red'>Error fetching data. Check console.</p>";
    });
}

function addRoute() {
  const name = document.getElementById("routeName").value;
  const origin = document.getElementById("origin").value;
  const dest = document.getElementById("destination").value;
  const distance = document.getElementById("distance").value;

  fetch(`admin_api.jsp?action=addRoute&name=${encodeURIComponent(name)}&origin=${encodeURIComponent(origin)}&destination=${encodeURIComponent(dest)}&distance=${distance}`)
    .then(res => res.json())
    .then(() => loadRoutes());
}

function deleteRoute(id) {
  if (confirm("Delete this route?")) {
    fetch(`admin_api.jsp?action=deleteRoute&id=${id}`)
      .then(res => res.json())
      .then(() => loadRoutes());
  }
}
