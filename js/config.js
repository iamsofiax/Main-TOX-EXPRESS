/**
 * API base URL. Default: same origin (works on Railway/Render with one service).
 * For split hosting (Cloudflare Pages + API), add to HTML:
 *   <meta name="tox-api-base" content="https://api.toxexpress.org">
 */
(function (global) {
    var base = '';
    if (typeof document !== 'undefined') {
        var meta = document.querySelector('meta[name="tox-api-base"]');
        if (meta && meta.content) base = meta.content.replace(/\/$/, '');
    }
    global.TOX_API_BASE = base;
    global.toxApi = function (path) {
        if (!path) return global.TOX_API_BASE;
        if (path.indexOf('http') === 0) return path;
        var p = path.charAt(0) === '/' ? path : '/' + path;
        return global.TOX_API_BASE + p;
    };
})(typeof window !== 'undefined' ? window : this);
