/**
 * API routing: toxexpress.org loads pages from Cloudflare (instant).
 * Live data (tracking, map) calls api.toxexpress.org — never the old Render URL.
 */
(function (global) {
    var host = global.location.hostname;
    var PUBLIC_SITE = { 'toxexpress.org': 1, 'www.toxexpress.org': 1 };
    global.TOX_API_BASE = PUBLIC_SITE[host] ? 'https://api.toxexpress.org' : '';
    global.toxApi = function (path) {
        if (!path) return global.TOX_API_BASE;
        if (path.indexOf('http') === 0) return path;
        var p = path.charAt(0) === '/' ? path : '/' + path;
        return global.TOX_API_BASE + p;
    };
})(typeof window !== 'undefined' ? window : this);
