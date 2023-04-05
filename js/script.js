// Preloader

const preloader = document.querySelector('#preloader');
if (preloader) {
  window.addEventListener('load', () => {
    preloader.remove();
  });
}

// sticky arrow-up icon
const scrollTop = document.querySelector('.arrow_up');
  if (scrollTop) {
    const togglescrollTop = function() {
      window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
    }
    window.addEventListener('load', togglescrollTop);
    document.addEventListener('scroll', togglescrollTop);
    scrollTop.addEventListener('click', window.scrollTo({
      top: 0,
      behavior: 'smooth'
  }));
}

// navbar sticky
window.addEventListener("scroll",function(){
    const header = document.getElementById("nav");
    nav.classList.toggle("sticky", window.scrollY > 0);
});

// navbar active

let navbarlinks = document.querySelectorAll('#navbar a');

function navbarlinksActive() {
  navbarlinks.forEach(navbarlink => {

    if (!navbarlink.hash) return;

    let section = document.querySelector(navbarlink.hash);
    if (!section) return;

    let position = window.scrollY + 200;

    if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
      navbarlink.classList.add('active');
    } else {
      navbarlink.classList.remove('active');
    }
  })
}
window.addEventListener('load', navbarlinksActive);
document.addEventListener('scroll', navbarlinksActive);

// mobile toggle

const mobileNavShow = document.querySelector('.mobile-nav-show');
const mobileNavHide = document.querySelector('.mobile-nav-hide');

document.querySelectorAll('.mobile-nav-toggle').forEach(el => {
  el.addEventListener('click', function(event) {
    event.preventDefault();
    mobileNavToogle();
  })
});

function mobileNavToogle() {
  document.querySelector('body').classList.toggle('mobile-nav-active');
  mobileNavShow.classList.toggle('d-none');
  mobileNavHide.classList.toggle('d-none');
}

// Hide mobile nav on same-page/hash links

document.querySelectorAll('#navbar a').forEach(navbarlink => {

  if (!navbarlink.hash) return;

  let section = document.querySelector(navbarlink.hash);
  if (!section) return;

  navbarlink.addEventListener('click', () => {
    if (document.querySelector('.mobile-nav-active')) {
      mobileNavToogle();
    }
  });

});

// Gallery slider
var TrandingSlider = new Swiper('.g-pagination', {
  effect: 'coverflow',
  grabCursor: true,
  centeredSlides: true,
  loop: true,
  slidesPerView: 'auto',
  coverflowEffect: {
    rotate: 0,
    stretch: 0,
    depth: 100,
    modifier: 2.5,
  },
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
});

// Event

var TrandingSlider = new Swiper('.e-pagination', {
  grabCursor: true,
  centeredSlides: true,
  loop: true,
  autoplay: {
    delay: 3500,
  },
  slidesPerView: 'auto',
  coverflowEffect: {
    rotate: 0,
    stretch: 0,
    depth: 100,
    modifier: 2.5,
  },
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
});

// Contact Alert Message
function message(){
  var Name= document.getElementById('name');
  var email= document.getElementById('email');
  var msg= document.getElementById('msg');
  const success = document.getElementById('success');
  const danger = document.getElementById('danger');

  if(Name.value === '' || email.value === '' || msg.value === ''){
    danger.style.display = 'block';
  }
  else{
    setTimeout(() => {
      Name.value = '';
      email.value = '';
      msg.value = '';
    }, 2000);
    success.style.display = 'block';
  }

  setTimeout(() => {
    danger.style.display = 'none';
    success.style.display = 'none';
  }, 4000);
}











