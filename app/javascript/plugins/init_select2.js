import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2-multiple').select2({
    width: '100%',
    placeholder: "Sélectionner (plusieurs choix possibles)"
  });
};

export { initSelect2 };
