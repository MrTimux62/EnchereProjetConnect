const searchbar = document.querySelector('#search-vente');
const searchcategorie = document.querySelector('#search-categorie');
const enchere_div = document.querySelectorAll('.enchere');
const categorie = document.querySelectorAll('.categorie-vente');

function search(e){
  enchere_div.forEach((item,index) => {
    if(!item.innerHTML.toLowerCase().includes(e.target.value)){
      item.style.display = 'none';
    }else {
      item.style.display = '';
    }
  })
}

function search_categorie(e){
  categorie.forEach((item,index) => {
    if(!item.value.toLowerCase().includes(e.target.value) && e.target.value != "all"){
      item.parentElement.style.display = 'none';
    }else {
      item.parentElement.style.display = '';
    }
  })
}

searchbar.addEventListener("keyup", search);  

searchcategorie.addEventListener("change", search_categorie);  