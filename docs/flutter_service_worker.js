'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "4dee4c007e75a926655c78ff59e7ece5",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"icons/Icon-192.png": "d6e7c19ebcd6b209ad15be9e8ffc63ec",
"icons/Icon-maskable-512.png": "a6cdcd537f047f2449554e3002391a09",
"icons/Icon-maskable-192.png": "d6e7c19ebcd6b209ad15be9e8ffc63ec",
"icons/Icon-512.png": "a6cdcd537f047f2449554e3002391a09",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"index.html": "40686f3047037b931632506823599c70",
"/": "40686f3047037b931632506823599c70",
"flutter_bootstrap.js": "26032479fb5208b680dbdd96616b2a59",
"main.dart.js": "365ac39df7d564281df9d482a9097652",
"assets/fonts/MaterialIcons-Regular.otf": "f58ed63e695e58246cd3eb174439471b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w300.ttf": "956c31a1d63d8e6ee21a8eafe7ac1834",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w500.ttf": "75e98a84aeb1d00d92c95681257838a4",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w200.ttf": "4035ea08f67b182417322b91c9ccf6f1",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w100.ttf": "706d8ef2125bc8eb5134c7481958d5f5",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w400.ttf": "e62e4dcabcc1b0a31af66cf1bdd8fb23",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w600.ttf": "77ab228e7ec30c50b2a10bc6a8f06a1b",
"assets/packages/lucide_icons_flutter/assets/lucide.ttf": "eb3a6b8aa16b16ea312b70820fccf0da",
"assets/AssetManifest.bin.json": "965fa768d5b9cf8df5d86639c0b11a22",
"assets/AssetManifest.json": "fffd9bf5a16c4f58f52141298e43a496",
"assets/AssetManifest.bin": "ccecaf26336b8e25512854c2daceb953",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "ab3084ab903fa937de257fd7f75245ef",
"assets/assets/profile.jpg": "2f0f4c03e22cf74c56b3085e5c3e56a7",
"assets/assets/access_pro_logo_dark.png": "7da23f718c14b970ee634ba8b38e098a",
"assets/assets/caba_now.webp": "9092b45ea7a38ea4018c0501a618c34d",
"assets/assets/profile.jpeg": "7def469e771bb96da3965c7e497b9600",
"assets/assets/flutter_icon.png": "40b742b411e88ed88f879496ddeaa4ef",
"assets/assets/gf_user.png": "bbbf942d23e923ee256d85a3884be582",
"assets/assets/onsite.webp": "f5981f5b163437108523ff3227d8aca6",
"assets/assets/global_reports.webp": "db652e58877e52d511680336f6109801",
"assets/assets/programmer.png": "f9422c00eefe2e2e3f31fca89c971eea",
"assets/assets/bg.png": "c32548b1be7ed113e7f2e3b37b1fe888",
"assets/assets/resume.pdf": "394225fe164f6dc6c85ff52654c1a697",
"assets/FontManifest.json": "8a2256be95dd076487d972d6ceac4af2",
"assets/resume.pdf": "394225fe164f6dc6c85ff52654c1a697",
"version.json": "35f693459fa671bd79f8a5b27aa4ddd9",
"favicon.png": "c295ba95c49333841f0e5ba7ac043bf5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
