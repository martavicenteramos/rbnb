import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('dog_location');
  if (addressInput) {
    places({ container: addressInput });
  }
  const cityInput = document.getElementById('dog_city');
  if (cityInput) {
    places({ container: cityInput });
  }
};

export { initAutocomplete };
