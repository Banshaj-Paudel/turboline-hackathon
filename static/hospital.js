window.onscroll = function() {
    var services = document.querySelector('.top-services');
    if (window.scrollY > 50) {
        services.classList.add('hidden');
    } else {
        services.classList.remove('hidden');
    }
};


//service-slides
let auto = 0;
let slide = document.getElementsByClassName("service-slide");
let wrapper = document.querySelector('.services-wrapper');

showSlide();

function showSlide() {
    
    if (auto >= slide.length) {
      auto = 0;
        wrapper.style.transition = "none"; // Disable transition for the reset
        wrapper.style.transform = `translateX(0)`; // Reset to the first slide
       
        setTimeout(() => {
            wrapper.style.transition = "transform 0.5s ease-in-out"; // Re-enable transition
            showSlide();
        }, 50); // Small delay to allow the browser to reset
    } else {
        wrapper.style.transform = `translateX(${-100 * auto}%)`;
        setTimeout(showSlide, 2000); // Change slide every 3 seconds
    }
    auto++;
}

//service slides ends


//doctors slides start


let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("slide");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}



