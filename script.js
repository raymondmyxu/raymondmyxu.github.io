const year = document.querySelector("#year");

if (year) {
  year.textContent = new Date().getFullYear();
}

const visitorMap = document.querySelector(".visitor-map[data-clustrmaps-id]");

if (visitorMap) {
  const mapId = visitorMap.dataset.clustrmapsId;
  const hasConfiguredMapId =
    mapId && mapId !== "REPLACE_WITH_YOUR_CLUSTRMAPS_ID";

  if (hasConfiguredMapId) {
    visitorMap.textContent = "";

    const clustrmapsScript = document.createElement("script");
    clustrmapsScript.type = "text/javascript";
    clustrmapsScript.id = "clustrmaps";
    clustrmapsScript.src = `https://clustrmaps.com/map_v2.js?d=${encodeURIComponent(
      mapId
    )}&cl=ffffff&w=260`;

    visitorMap.appendChild(clustrmapsScript);
  }
}
