const zomatoInnerCard = document.querySelector('#add-channel-inner-zomato')
const tripAdvisorInnerCard = document.querySelector('#add-channel-inner-tripadvisor')
const yelpInnerCard = document.querySelector('#add-channel-inner-yelp')
const facebookInnerCard = document.querySelector('#add-channel-inner-facebook')
const instagramInnerCard = document.querySelector('#add-channel-inner-instagram')
const foursquareInnerCard = document.querySelector('#add-channel-inner-foursquare')

const zomatoFrontCard = document.querySelector('#add-channel-front-zomato')
const tripAdvisorFrontCard = document.querySelector('#add-channel-front-tripadvisor')
const yelpFrontCard = document.querySelector('#add-channel-front-yelp')
const facebookFrontCard = document.querySelector('#add-channel-front-facebook')
const instagramFrontCard = document.querySelector('#add-channel-front-instagram')
const foursquareFrontCard = document.querySelector('#add-channel-front-foursquare')

const cardSets = [[zomatoInnerCard, zomatoFrontCard], [tripAdvisorInnerCard, tripAdvisorFrontCard],
                  [yelpInnerCard,yelpFrontCard], [facebookInnerCard, facebookFrontCard],
                  [instagramInnerCard, instagramFrontCard], [foursquareInnerCard, foursquareFrontCard]];



cardSets.forEach((cardSet) => {
  if (cardSet[0] !== null) {
    cardSet[1].addEventListener('click', (e) => {
      cardSet[0].classList.add("rotate");
    });
  };
})
