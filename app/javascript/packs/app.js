window.onload = function() {

const btnPlusSubItem = document.querySelectorAll('.plus-item-btn');

btnPlusSubItem.forEach(elem => elem.addEventListener('click', openAddSubItemForm));

function openAddSubItemForm(e) {
    let allHiddenForms = document.querySelectorAll('.add-sub-form-wrapper')

    this.classList.toggle('plus-item-active')

    let keyValue = this.getAttribute('data-key');

    allHiddenForms.forEach(elem => {
        if(elem.getAttribute('data-key') == keyValue){
            elem.classList.toggle('add-sub-form-active')
        }
    })
}
}
