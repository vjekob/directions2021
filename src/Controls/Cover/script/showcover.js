function ShowCover(isbn) {
    document.body.innerHTML = isbn ? `<img style="max-width: 120px; max-height: 160px" src="http://covers.openlibrary.org/b/isbn/${isbn}-M.jpg">` : "";
}
