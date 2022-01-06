
const actualBtn = document.getElementById('actual-btn');
const fileChosen = document.getElementById('file-chosen');
const fileImage = document.getElementById('file-image');
actualBtn.addEventListener('change', function(){
  fileChosen.value = this.files[0].name;
  fileImage.src = URL.createObjectURL(this.files[0])
})


const actualBtn2 = document.getElementById('actual-btn2');
const fileChosen2 = document.getElementById('file-chosen2');
const fileImage2 = document.getElementById('file-image2');
actualBtn2.addEventListener('change', function(){
  fileChosen2.value = this.files[0].name;
  fileImage2.src = URL.createObjectURL(this.files[0])
})