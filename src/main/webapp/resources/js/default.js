const document_head = document.head;

const RESOURCE_PATH = window.location.origin + "/membership/resources/";
const FOLDER_PATH = document.head.dataset.id + "/";
const FILE_PATH = window.location.pathname.split("/").slice(-1);

const main_css = document.createElement("link");
main_css.href = RESOURCE_PATH + "css/main.css";
main_css.rel = "stylesheet";
main_css.type = "text/css";

const document_css = document.createElement("link");
document_css.href = RESOURCE_PATH + "css/" + FOLDER_PATH + FILE_PATH + ".css";
document_css.rel = "stylesheet";
document_css.type = "text/css";

const http_request = document.createElement("script");
http_request.type = "text/javascript";
http_request.src = RESOURCE_PATH + "js/http_request.js";

const main_js = document.createElement("script");
main_js.type = "text/javascript";
main_js.src = RESOURCE_PATH + "js/main.js";
main_js.defer = true;

const document_js = document.createElement("script");
document_js.type = "text/javascript";
document_js.src = RESOURCE_PATH + "js/" + FOLDER_PATH + FILE_PATH + ".js";

document_head.appendChild(main_css);
document_head.appendChild(document_css)
document_head.appendChild(http_request);
document_head.appendChild(main_js);
document_head.appendChild(document_js);