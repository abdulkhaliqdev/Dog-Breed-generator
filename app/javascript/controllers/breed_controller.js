import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="breed"
export default class extends Controller {
  connect() {
    this.input = this.element.querySelector('#breedInput');
    this.input.addEventListener('input', this.handleInputChange.bind(this));
  }

  resetForm(event) {
    const breedFormContainer = document.getElementById('breedFormContainer');
    breedFormContainer.classList.remove('col');
    breedFormContainer.classList.add('col-lg-6', 'col-md-12');

    const breedInfoContainer = document.getElementById('breedInfoContainer');
    breedInfoContainer.classList.add('col-lg-6', 'col-md-12');
  }

  handleInputChange(event) {
    if(event.target.value.length > 3){
      document.getElementById('breedSubmitButton').disabled = false;
    }else if(event.target.value.length <= 3){
      document.getElementById('breedSubmitButton').disabled = true;
    }
  }
}
