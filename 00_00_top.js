let areaDisplay = true
let arealist = document.querySelector("#area-list");
let areaBtn = document.querySelector("#areaBtn");
areaBtn.addEventListener("click", () => {
  if(areaDisplay){
    arealist.style.display = "block";
  }else{
    arealist.style.display = "none";
  }
  areaDisplay = !areaDisplay
})

let areaItem = document.querySelectorAll(".area-item");
let locationInput = document.querySelector("#location-input");
for(let i = 0; i<areaItem.length; i++){
  areaItem[i].addEventListener("click", (e) => {
    let text = e.target.dataset.short;
    areaBtn.textContent = text;
    arealist.style.display = "none";
    areaDisplay = true;
	let locationValue = areaItem[i].getAttribute("value");
	locationInput.value = locationValue;
	console.log("Selected Location: ", locationValue);
  })
}

let recommendItem = document.querySelectorAll(".recommend-item");
for(let i = 0; i<recommendItem.length; i++){
  recommendItem[i].addEventListener("click", (e) => {
    let commText = e.target.text;
    document.querySelector("#search-box").value = commText;
  })
}

let topForm = document.querySelector("#top-form");
let search = document.querySelector("#search-btn");
search.addEventListener("click", () => {
	topForm.action = "03_02_categoryPro.jsp";
	form.submit();
});

