(function () {
  function applyLang(lang) {
    var root = document.documentElement;
    if (lang === "hu") {
      root.classList.add("lang-hu");
      root.setAttribute("lang", "hu");
    } else {
      root.classList.remove("lang-hu");
      root.setAttribute("lang", "en");
    }
    var btns = document.querySelectorAll(".lang-btn");
    for (var i = 0; i < btns.length; i++) {
      btns[i].classList.toggle("active", btns[i].getAttribute("data-set-lang") === lang);
    }
    try {
      localStorage.setItem("ngd_starviper_lang", lang);
    } catch (_) {}
  }

  var saved = "en";
  try {
    saved = localStorage.getItem("ngd_starviper_lang") || "en";
  } catch (_) {}
  applyLang(saved);

  document.addEventListener("DOMContentLoaded", function () {
    applyLang(saved);
    var btns = document.querySelectorAll(".lang-btn");
    for (var i = 0; i < btns.length; i++) {
      btns[i].addEventListener("click", function () {
        applyLang(this.getAttribute("data-set-lang"));
      });
    }
  });
})();
