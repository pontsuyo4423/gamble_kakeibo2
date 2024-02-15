document.addEventListener("turbo:load", function() {
  document.querySelectorAll(".delete-link").forEach(function(element) {
    element.addEventListener("click", function(e) {
      const customConfirmMessage = this.getAttribute("data-custom-confirm");
      if (!confirm(customConfirmMessage)) {
        e.preventDefault(); // 「キャンセル」が選択された場合は、アクションを停止
      }
    });
  });
});
