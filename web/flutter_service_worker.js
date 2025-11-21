'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0f2cb80ca374ef95a3d890f787a07391",
"assets/AssetManifest.bin.json": "f8372530823211cb5c00e64e956723a8",
"assets/AssetManifest.json": "75eca1b8c75f2191b85bbad494827e0e",
"assets/assets/fonts/Inter-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/Inter-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/Inter-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/poppins.medium.ttf": "a4e11dda40531debd374e4c8b1dcc7f4",
"assets/assets/fonts/poppins.regular.ttf": "731a28a413d642522667a2de8681ff35",
"assets/assets/icons/cart.svg": "af3f1380842037ee8179631d5b874bff",
"assets/assets/icons/cross_icon.svg": "505d32ec0c30bfee001fbe9edb63e3e4",
"assets/assets/icons/deleteicon.svg": "ac1033c67bfdd2b77a45520e1ca06565",
"assets/assets/icons/heart.svg": "04d1a645e27fb06a2fdac2db0bb23a38",
"assets/assets/icons/home.svg": "6b8e168bbb00db5cbfbf332137ca5858",
"assets/assets/icons/leftarrow.svg": "9305f737fd9b5e904786ee25738a3ba3",
"assets/assets/icons/legal.svg": "f9f0b7741f595bbff058e23df1e90dde",
"assets/assets/icons/order.svg": "9f08eb3295cbf8f7e2d619045b72867a",
"assets/assets/icons/profile.svg": "e6e5f27e3ba813feb5bb5098dde9f89f",
"assets/assets/icons/profile_heart.svg": "50996cca92e1d7f2f7d28cba80c18d19",
"assets/assets/icons/rightarrow.svg": "9e091e2d61db5eb0a35b11788c5eac90",
"assets/assets/icons/search_icon.svg": "1a3d548ea526bccf65490121ff540665",
"assets/assets/icons/wishlist.svg": "87456d5016008993f7f3bc5e151443eb",
"assets/assets/images/cart1.png": "ed9e04089fe38fd4a1efdb66240e2f5e",
"assets/assets/images/cart2.png": "f187a6db1ccb332929fb9f5eac87b6f9",
"assets/assets/images/cats1.png": "d3a9ca1c4a7047077153343b8ca60bc3",
"assets/assets/images/cats2.png": "728cec9dc74180f7cae5bf492b94f6da",
"assets/assets/images/cats3.png": "f95064397dd2e15bbabf16f76577fb4b",
"assets/assets/images/cats4.png": "1bc32deff11d4d25b1cfb5531730f3d2",
"assets/assets/images/cats5.png": "2ff8190f1a8b9d98609e1445e1c8c962",
"assets/assets/images/logo.png": "edadeefadd6394f8df0d98d2dd9ea184",
"assets/assets/images/pro1.png": "ef54031a804acbb499dda24827791aae",
"assets/assets/images/pro2.png": "534924e330a911adb54d672ab59279a1",
"assets/assets/images/pro3.png": "695c08410abbe15ddb777256932175af",
"assets/assets/images/profile.png": "95b063f38c9a48f076bff892965b1ce6",
"assets/assets/images/slider1.png": "509a009cb6fa0613c2b9830b705b5fdc",
"assets/assets/images/slider2.png": "6063b2433dea2deda883f55efaaa1a86",
"assets/assets/images/slider3.png": "bddd04287671c5f3665ed49e2ae78b8c",
"assets/assets/images/slider4.png": "82136febd6a6bc3192950fea703659dd",
"assets/assets/images/toy1.png": "8547cf00d34ff1969cf31188d0b9c594",
"assets/FontManifest.json": "652a01000ed9d2d122a180e0e96e65a4",
"assets/fonts/MaterialIcons-Regular.otf": "4ce2e1a43901010dd1fd1e76d55faab8",
"assets/NOTICES": "8f6c99e12a43b1c35f37499b66b805ba",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "d5109061fc7df33d041f4a006bd23686",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6e57b75e5a79c70591ebb9bc1e4c9068",
"/": "6e57b75e5a79c70591ebb9bc1e4c9068",
"main.dart.js": "60abba72bf553ec1180c3514dd7f4521",
"manifest.json": "c9c6e178b1a37f4ddb356807fa7235ed",
"version.json": "a3322b2f035e5345663b567001345585"};
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
