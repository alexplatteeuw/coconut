import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const setFlatPickr = function() {

const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

flatpickr("#range_start", {
  altInput: true,
  disable: unvailableDates,
  plugins: [new rangePlugin({ input: "#range_end"})]
  // disable: unvailableDates
});
};

export { setFlatPickr }
