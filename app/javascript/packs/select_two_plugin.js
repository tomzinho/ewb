import $ from 'jquery';
import 'select2';

const initSelect2city = () => {
  $('.select2-city').select2({
    placeholder: 'Select your current city:'
  })
};

const initSelect2skills = () => {
  $('.select2-skills').select2({
    multiple:  true, // (~ document.querySelectorAll)
    placeholder: 'Select your Skills!'
  })
};
export { initSelect2city };

export { initSelect2skills };
