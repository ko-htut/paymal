'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "a0ade96e16b5eb9bac338746abd0e3f8",
"main.dart.js": "9f80b6b78238b146405f813b9cad996e",
"index.html": "3515a956369a0c5bac784003d9a6fadf",
"/": "3515a956369a0c5bac784003d9a6fadf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "281e772ae09a3e58fd26fc24f8977437",
"assets/NOTICES": "e4dfd7e83d87b87866a86821b5698a29",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/image/XBOX.png": "eed291948b70c05b5a568b61ba6649f6",
"assets/assets/image/Skype1.png": "411073520416a171abb338426829b57b",
"assets/assets/image/logo%2520Tango.png": "3f21f804bd30031895d321783bab1d76",
"assets/assets/image/AppleCard.png": "4281762364b2af2a4c2f007be12ee151",
"assets/assets/image/Viber.png": "cb3fdd3ba6b466931b8da4f952992bde",
"assets/assets/image/IMVU.png": "d284d30c244fc534827bc50056e6f0ee",
"assets/assets/image/Slice.png": "44731e4fa69918050610fd511b6357c3",
"assets/assets/image/Razer%2520Gold.png": "279094e872c5e72a649436195f5628ee",
"assets/assets/image/Runescape.png": "d7248e65bdff9a95accccf2f34e7662c",
"assets/assets/image/PlayStation%2520Network.png": "dd7e31b1cb161f132d0c350b95892368",
"assets/assets/image/Nintendo%2520eShop.png": "2a15dbb1c4488e820090d5adbfedcb04",
"assets/assets/image/eBay.png": "a1d2a461749e2b2cbd25cb386a9dcb08",
"assets/assets/image/Karma%2520Koin2.png": "0a05ba0f05e6ffa42686018ed8a59b62",
"assets/assets/image/Amazon.png": "3c6efef59408df979c50f3013631fa3f",
"assets/assets/image/apple.png": "1e3c4773b5c56480f5dab0d9639f9fcd",
"assets/assets/image/Fortnite.png": "4b3119b0c11968e5d4ab2181095c6ed6",
"assets/assets/image/Spotify.png": "0a4ff0e868832f3c37c3b22d1d41dcc6",
"assets/assets/image/FreeFire.png": "316bbe11131621771a6398d221486efd",
"assets/assets/image/Blade%2520&%2520Soul.png": "19b02f8c71892be2241842bccc610336",
"assets/assets/image/Skype2.png": "ade2401bfa6ba8fdf4136fb52f851603",
"assets/assets/image/google.png": "f63275737794b72caaf829d8551ef704",
"assets/assets/image/Minecraft.png": "d8ac75d5b11423fa7a87c2050c350755",
"assets/assets/image/PUBG.png": "b89cfc1782946630dc6c77159ab31a6c",
"assets/assets/image/Roblox.png": "d6cf4bbd44417270ab40d5c780b32896",
"assets/assets/image/Steam%2520Wallet.png": "904c17c658b3f241a88d2a78d31c0b4d",
"assets/assets/nrc.json": "baade67abdbea6cd7a3eb365505c1982",
"assets/lib/language/en.json": "95a2f2ad9b4c1e10780fd2f460c64ab4",
"assets/lib/language/my.json": "4cd7e018055a87b04084c9ee11f4c549",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "b29140f34a709c479f074eaf2d339491",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
