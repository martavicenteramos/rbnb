import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('dog_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };