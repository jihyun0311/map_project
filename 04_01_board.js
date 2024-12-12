let select = document.querySelector("#selec");
let sort = document.querySelector("#sort");
let form = document.querySelector("#boardForm");
select.addEventListener("change", (e) => {
	let text = e.target.value;
	sort.value = text;
	console.log(text);
	form.action = "04_02_boardPro.jsp";
	console.log(form);
	form.submit();

});
