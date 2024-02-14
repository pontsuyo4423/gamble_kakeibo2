document.addEventListener("turbo:load", function() {
  document.querySelectorAll(".logout-btn").forEach(function(element) {
    element.addEventListener("click", function(e) {
      e.preventDefault(); // デフォルトのリンク動作を停止

      if (confirm("本当にログアウトしますか？")) { // 確認ダイアログを表示
        const token = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
        fetch(this.getAttribute("href"), {
          method: 'DELETE',
          headers: {
            "X-CSRF-Token": token,
            "Content-Type": "application/json"
          },
          credentials: "include"
        }).then(response => {
          if (response.ok) {
            return response.text();
          }
          throw new Error('Network response was not ok.');
        }).then(html => {
          window.location.href = "/";
        }).catch(error => console.error('There has been a problem with your fetch operation:', error));
      }
    });
  });
});
