let areaBtn = document.querySelector("#areaBtn");
let areaList = document.querySelector("#area-list");
let display = true;
areaBtn.addEventListener("click", () => {
  if(display){
    areaList.style.display = "block";
    display = false;
  }else{
    areaList.style.display = "none";
    display = true;
  }
})

let areaItem = document.querySelectorAll(".area-item");
let locationInput = document.querySelector("#location-input");
for(let i = 0; i<areaItem.length; i++){
  areaItem[i].addEventListener("click", (e) => {
    let text = e.target.dataset.short;
    areaBtn.textContent = text;
    areaList.style.display = "none";
    display = true;
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


