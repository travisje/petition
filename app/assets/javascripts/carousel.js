$(document).foundation();

$(document).ready(function(){
  $('.carousel').slick({
    autoplay: true,
    autoplaySpeed: 7000
  });
});

$(document).ready(function(){
  $('.news-carousel').slick({
    autoplay: false,
    autoplaySpeed: 7000
  });
});

$(document).ready(function(){
  $('.apps').slick({
    dots: true,
    infinite: false,
    speed: 300,
    slidesToShow: 7,
    slidesToScroll: 7,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 6,
          slidesToScroll: 6,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 820,
        settings: {
          slidesToShow: 5,
          slidesToScroll: 5,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 4,
          slidesToScroll: 4
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        }
      },
      {
        breakpoint: 360,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
  });
});