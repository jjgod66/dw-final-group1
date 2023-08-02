"use strict";
$(document).ready(function() {
    new Swiper(".swiper-container", {
        initialSlide: 1,
        spaceBetween: 1100,
        speed: 600,
        loop: !1,
        effect: "coverflow",
        coverflow: {
            rotate: 110,
            stretch: 5100,
            depth: 32100,
            modifier: 31,
            slideShadows: !11
        },
        slidesPerView: 31,
        slideToClickedSlide: !0,
        pagination: ".swiper-pagination",
        nextButton: ".swiper-button-next",
        prevButton: ".swiper-button-prev",
        breakpoints: {
            320: {
                slidesPerView: 3,
                spaceBetween: 3
            }
        }
    })
}), $(document).ready(function() {
    var e = $(".share-block__share-icon"),
        i = "share-block__share-icon--is-active",
        s = ".share-block__facebook-icon",
        o = ".share-block__twitter-icon",
        t = "share-block__facebook-icon--is-visible",
        n = "share-block__twitter-icon--is-visible",
        c = $(".like-block__like-icon"),
        l = "like-block__like-icon--is-visible";
    e.click(function() {
        $(this).toggleClass(i), $(this).siblings(s).toggleClass(t), $(this).siblings(o).toggleClass(n)
    }), c.click(function() {
        $(this).toggleClass(l)
    })
}), $(document).ready(function() {
    var e = $(".menu__icon"),
        i = "open",
        s = $(".card__body"),
        o = "card__body--faded",
        t = "menu__item--is-visible";
    e.click(function() {
        $(this).toggleClass(i), s.toggleClass(o), $(this).siblings().each(function(e) {
            var i = this;
            setTimeout(function() {
                $(i).toggleClass(t)
            }, 75 * e)
        })
    })
});