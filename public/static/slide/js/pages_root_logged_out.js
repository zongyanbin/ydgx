! function (e) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], e) : "undefined" != typeof exports ? module.exports = e(require("jquery")) : e(jQuery)
}(function (c) {
    "use strict";
    var l = window.Slick || {};
    (l = function () {
        function e(e, i) {
            var t, o = this;
            o.defaults = {
                accessibility: !0,
                adaptiveHeight: !1,
                appendArrows: c(e),
                appendDots: c(e),
                arrows: !0,
                asNavFor: null,
                prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button">Previous</button>',
                nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button">Next</button>',
                autoplay: !1,
                autoplaySpeed: 3e3,
                centerMode: !1,
                centerPadding: "50px",
                cssEase: "ease",
                customPaging: function (e, i) {
                    return c('<button type="button" data-role="none" role="button" tabindex="0" />').text(i + 1)
                }, dots: !1,
                dotsClass: "slick-dots",
                draggable: !0,
                easing: "linear",
                edgeFriction: .35,
                fade: !1,
                focusOnSelect: !1,
                infinite: !0,
                initialSlide: 0,
                lazyLoad: "ondemand",
                mobileFirst: !1,
                pauseOnHover: !0,
                pauseOnFocus: !0,
                pauseOnDotsHover: !1,
                respondTo: "window",
                responsive: null,
                rows: 1,
                rtl: !1,
                slide: "",
                slidesPerRow: 1,
                slidesToShow: 1,
                slidesToScroll: 1,
                speed: 500,
                swipe: !0,
                swipeToSlide: !1,
                touchMove: !0,
                touchThreshold: 5,
                useCSS: !0,
                useTransform: !0,
                variableWidth: !1,
                vertical: !1,
                verticalSwiping: !1,
                waitForAnimate: !0,
                zIndex: 1e3
            }, o.initials = {
                animating: !1,
                dragging: !1,
                autoPlayTimer: null,
                currentDirection: 0,
                currentLeft: null,
                currentSlide: 0,
                direction: 1,
                $dots: null,
                listWidth: null,
                listHeight: null,
                loadIndex: 0,
                $nextArrow: null,
                $prevArrow: null,
                slideCount: null,
                slideWidth: null,
                $slideTrack: null,
                $slides: null,
                sliding: !1,
                slideOffset: 0,
                swipeLeft: null,
                $list: null,
                touchObject: {},
                transformsEnabled: !1,
                unslicked: !1
            }, c.extend(o, o.initials), o.activeBreakpoint = null, o.animType = null, o.animProp = null, o.breakpoints = [], o.breakpointSettings = [], o.cssTransitions = !1, o.focussed = !1, o.interrupted = !1, o.hidden = "hidden", o.paused = !0, o.positionProp = null, o.respondTo = null, o.rowCount = 1, o.shouldClick = !0, o.$slider = c(e), o.$slidesCache = null, o.transformType = null, o.transitionType = null, o.visibilityChange = "visibilitychange", o.windowWidth = 0, o.windowTimer = null, t = c(e).data("slick") || {}, o.options = c.extend({}, o.defaults, i, t), o.currentSlide = o.options.initialSlide, o.originalSettings = o.options, "undefined" != typeof document.mozHidden ? (o.hidden = "mozHidden", o.visibilityChange = "mozvisibilitychange") : "undefined" != typeof document.webkitHidden && (o.hidden = "webkitHidden", o.visibilityChange = "webkitvisibilitychange"), o.autoPlay = c.proxy(o.autoPlay, o), o.autoPlayClear = c.proxy(o.autoPlayClear, o), o.autoPlayIterator = c.proxy(o.autoPlayIterator, o), o.changeSlide = c.proxy(o.changeSlide, o), o.clickHandler = c.proxy(o.clickHandler, o), o.selectHandler = c.proxy(o.selectHandler, o), o.setPosition = c.proxy(o.setPosition, o), o.swipeHandler = c.proxy(o.swipeHandler, o), o.dragHandler = c.proxy(o.dragHandler, o), o.keyHandler = c.proxy(o.keyHandler, o), o.instanceUid = s++, o.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/, o.registerBreakpoints(), o.init(!0)
        }
        var s = 0;
        return e
    }()).prototype.activateADA = function () {
        this.$slideTrack.find(".slick-active").attr({
            "aria-hidden": "false"
        }).find("a, input, button, select").attr({
            tabindex: "0"
        })
    }, l.prototype.addSlide = l.prototype.slickAdd = function (e, i, t) {
        var o = this;
        if ("boolean" == typeof i) t = i, i = null;
        else if (i < 0 || i >= o.slideCount) return !1;
        o.unload(), "number" == typeof i ? 0 === i && 0 === o.$slides.length ? c(e).appendTo(o.$slideTrack) : t ? c(e).insertBefore(o.$slides.eq(i)) : c(e).insertAfter(o.$slides.eq(i)) : !0 === t ? c(e).prependTo(o.$slideTrack) : c(e).appendTo(o.$slideTrack), o.$slides = o.$slideTrack.children(this.options.slide), o.$slideTrack.children(this.options.slide).detach(), o.$slideTrack.append(o.$slides), o.$slides.each(function (e, i) {
            c(i).attr("data-slick-index", e)
        }), o.$slidesCache = o.$slides, o.reinit()
    }, l.prototype.animateHeight = function () {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight && !1 === e.options.vertical) {
            var i = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.animate({
                height: i
            }, e.options.speed)
        }
    }, l.prototype.animateSlide = function (e, i) {
        var t = {},
            o = this;
        o.animateHeight(), !0 === o.options.rtl && !1 === o.options.vertical && (e = -e), !1 === o.transformsEnabled ? !1 === o.options.vertical ? o.$slideTrack.animate({
            left: e
        }, o.options.speed, o.options.easing, i) : o.$slideTrack.animate({
            top: e
        }, o.options.speed, o.options.easing, i) : !1 === o.cssTransitions ? (!0 === o.options.rtl && (o.currentLeft = -o.currentLeft), c({
            animStart: o.currentLeft
        }).animate({
            animStart: e
        }, {
            duration: o.options.speed,
            easing: o.options.easing,
            step: function (e) {
                e = Math.ceil(e), !1 === o.options.vertical ? t[o.animType] = "translate(" + e + "px, 0px)" : t[o.animType] = "translate(0px," + e + "px)", o.$slideTrack.css(t)
            }, complete: function () {
                i && i.call()
            }
        })) : (o.applyTransition(), e = Math.ceil(e), !1 === o.options.vertical ? t[o.animType] = "translate3d(" + e + "px, 0px, 0px)" : t[o.animType] = "translate3d(0px," + e + "px, 0px)", o.$slideTrack.css(t), i && setTimeout(function () {
            o.disableTransition(), i.call()
        }, o.options.speed))
    }, l.prototype.getNavTarget = function () {
        var e = this,
            i = e.options.asNavFor;
        return i && null !== i && (i = c(i).not(e.$slider)), i
    }, l.prototype.asNavFor = function (i) {
        var e = this.getNavTarget();
        null !== e && "object" == typeof e && e.each(function () {
            var e = c(this).slick("getSlick");
            e.unslicked || e.slideHandler(i, !0)
        })
    }, l.prototype.applyTransition = function (e) {
        var i = this,
            t = {};
        !1 === i.options.fade ? t[i.transitionType] = i.transformType + " " + i.options.speed + "ms " + i.options.cssEase : t[i.transitionType] = "opacity " + i.options.speed + "ms " + i.options.cssEase, !1 === i.options.fade ? i.$slideTrack.css(t) : i.$slides.eq(e).css(t)
    }, l.prototype.autoPlay = function () {
        var e = this;
        e.autoPlayClear(), e.slideCount > e.options.slidesToShow && (e.autoPlayTimer = setInterval(e.autoPlayIterator, e.options.autoplaySpeed))
    }, l.prototype.autoPlayClear = function () {
        var e = this;
        e.autoPlayTimer && clearInterval(e.autoPlayTimer)
    }, l.prototype.autoPlayIterator = function () {
        var e = this,
            i = e.currentSlide + e.options.slidesToScroll;
        e.paused || e.interrupted || e.focussed || (!1 === e.options.infinite && (1 === e.direction && e.currentSlide + 1 === e.slideCount - 1 ? e.direction = 0 : 0 === e.direction && (i = e.currentSlide - e.options.slidesToScroll, e.currentSlide - 1 == 0 && (e.direction = 1))), e.slideHandler(i))
    }, l.prototype.buildArrows = function () {
        var e = this;
        !0 === e.options.arrows && (e.$prevArrow = c(e.options.prevArrow).addClass("slick-arrow"), e.$nextArrow = c(e.options.nextArrow).addClass("slick-arrow"), e.slideCount > e.options.slidesToShow ? (e.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), e.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), e.htmlExpr.test(e.options.prevArrow) && e.$prevArrow.prependTo(e.options.appendArrows), e.htmlExpr.test(e.options.nextArrow) && e.$nextArrow.appendTo(e.options.appendArrows), !0 !== e.options.infinite && e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true")) : e.$prevArrow.add(e.$nextArrow).addClass("slick-hidden").attr({
            "aria-disabled": "true",
            tabindex: "-1"
        }))
    }, l.prototype.buildDots = function () {
        var e, i, t = this;
        if (!0 === t.options.dots && t.slideCount > t.options.slidesToShow) {
            for (t.$slider.addClass("slick-dotted"), i = c("<ul />").addClass(t.options.dotsClass), e = 0; e <= t.getDotCount(); e += 1) i.append(c("<li />").append(t.options.customPaging.call(this, t, e)));
            t.$dots = i.appendTo(t.options.appendDots), t.$dots.find("li").first().addClass("slick-active").attr("aria-hidden", "false")
        }
    }, l.prototype.buildOut = function () {
        var e = this;
        e.$slides = e.$slider.children(e.options.slide + ":not(.slick-cloned)").addClass("slick-slide"), e.slideCount = e.$slides.length, e.$slides.each(function (e, i) {
            c(i).attr("data-slick-index", e).data("originalStyling", c(i).attr("style") || "")
        }), e.$slider.addClass("slick-slider"), e.$slideTrack = 0 === e.slideCount ? c('<div class="slick-track"/>').appendTo(e.$slider) : e.$slides.wrapAll('<div class="slick-track"/>').parent(), e.$list = e.$slideTrack.wrap('<div aria-live="polite" class="slick-list"/>').parent(), e.$slideTrack.css("opacity", 0), !0 !== e.options.centerMode && !0 !== e.options.swipeToSlide || (e.options.slidesToScroll = 1), c("img[data-lazy]", e.$slider).not("[src]").addClass("slick-loading"), e.setupInfinite(), e.buildArrows(), e.buildDots(), e.updateDots(), e.setSlideClasses("number" == typeof e.currentSlide ? e.currentSlide : 0), !0 === e.options.draggable && e.$list.addClass("draggable")
    }, l.prototype.buildRows = function () {
        var e, i, t, o, s, n, r, l = this;
        if (o = document.createDocumentFragment(), n = l.$slider.children(), 1 < l.options.rows) {
            for (r = l.options.slidesPerRow * l.options.rows, s = Math.ceil(n.length / r), e = 0; e < s; e++) {
                var a = document.createElement("div");
                for (i = 0; i < l.options.rows; i++) {
                    var d = document.createElement("div");
                    for (t = 0; t < l.options.slidesPerRow; t++) {
                        var c = e * r + (i * l.options.slidesPerRow + t);
                        n.get(c) && d.appendChild(n.get(c))
                    }
                    a.appendChild(d)
                }
                o.appendChild(a)
            }
            l.$slider.empty().append(o), l.$slider.children().children().children().css({
                width: 100 / l.options.slidesPerRow + "%",
                display: "inline-block"
            })
        }
    }, l.prototype.checkResponsive = function (e, i) {
        var t, o, s, n = this,
            r = !1,
            l = n.$slider.width(),
            a = window.innerWidth || c(window).width();
        if ("window" === n.respondTo ? s = a : "slider" === n.respondTo ? s = l : "min" === n.respondTo && (s = Math.min(a, l)), n.options.responsive && n.options.responsive.length && null !== n.options.responsive) {
            for (t in o = null, n.breakpoints) n.breakpoints.hasOwnProperty(t) && (!1 === n.originalSettings.mobileFirst ? s < n.breakpoints[t] && (o = n.breakpoints[t]) : s > n.breakpoints[t] && (o = n.breakpoints[t]));
            null !== o ? null !== n.activeBreakpoint ? (o !== n.activeBreakpoint || i) && (n.activeBreakpoint = o, "unslick" === n.breakpointSettings[o] ? n.unslick(o) : (n.options = c.extend({}, n.originalSettings, n.breakpointSettings[o]), !0 === e && (n.currentSlide = n.options.initialSlide), n.refresh(e)), r = o) : (n.activeBreakpoint = o, "unslick" === n.breakpointSettings[o] ? n.unslick(o) : (n.options = c.extend({}, n.originalSettings, n.breakpointSettings[o]), !0 === e && (n.currentSlide = n.options.initialSlide), n.refresh(e)), r = o) : null !== n.activeBreakpoint && (n.activeBreakpoint = null, n.options = n.originalSettings, !0 === e && (n.currentSlide = n.options.initialSlide), n.refresh(e), r = o), e || !1 === r || n.$slider.trigger("breakpoint", [n, r])
        }
    }, l.prototype.changeSlide = function (e, i) {
        var t, o, s = this,
            n = c(e.currentTarget);
        switch (n.is("a") && e.preventDefault(), n.is("li") || (n = n.closest("li")), t = s.slideCount % s.options.slidesToScroll != 0 ? 0 : (s.slideCount - s.currentSlide) % s.options.slidesToScroll, e.data.message) {
        case "previous":
            o = 0 === t ? s.options.slidesToScroll : s.options.slidesToShow - t, s.slideCount > s.options.slidesToShow && s.slideHandler(s.currentSlide - o, !1, i);
            break;
        case "next":
            o = 0 === t ? s.options.slidesToScroll : t, s.slideCount > s.options.slidesToShow && s.slideHandler(s.currentSlide + o, !1, i);
            break;
        case "index":
            var r = 0 === e.data.index ? 0 : e.data.index || n.index() * s.options.slidesToScroll;
            s.slideHandler(s.checkNavigable(r), !1, i), n.children().trigger("focus");
            break;
        default:
            return
        }
    }, l.prototype.checkNavigable = function (e) {
        var i, t;
        if (t = 0, e > (i = this.getNavigableIndexes())[i.length - 1]) e = i[i.length - 1];
        else
            for (var o in i) {
                if (e < i[o]) {
                    e = t;
                    break
                }
                t = i[o]
            }
        return e
    }, l.prototype.cleanUpEvents = function () {
        var e = this;
        e.options.dots && null !== e.$dots && c("li", e.$dots).off("click.slick", e.changeSlide).off("mouseenter.slick", c.proxy(e.interrupt, e, !0)).off("mouseleave.slick", c.proxy(e.interrupt, e, !1)), e.$slider.off("focus.slick blur.slick"), !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow && e.$prevArrow.off("click.slick", e.changeSlide), e.$nextArrow && e.$nextArrow.off("click.slick", e.changeSlide)), e.$list.off("touchstart.slick mousedown.slick", e.swipeHandler), e.$list.off("touchmove.slick mousemove.slick", e.swipeHandler), e.$list.off("touchend.slick mouseup.slick", e.swipeHandler), e.$list.off("touchcancel.slick mouseleave.slick", e.swipeHandler), e.$list.off("click.slick", e.clickHandler), c(document).off(e.visibilityChange, e.visibility), e.cleanUpSlideEvents(), !0 === e.options.accessibility && e.$list.off("keydown.slick", e.keyHandler), !0 === e.options.focusOnSelect && c(e.$slideTrack).children().off("click.slick", e.selectHandler), c(window).off("orientationchange.slick.slick-" + e.instanceUid, e.orientationChange), c(window).off("resize.slick.slick-" + e.instanceUid, e.resize), c("[draggable!=true]", e.$slideTrack).off("dragstart", e.preventDefault), c(window).off("load.slick.slick-" + e.instanceUid, e.setPosition), c(document).off("ready.slick.slick-" + e.instanceUid, e.setPosition)
    }, l.prototype.cleanUpSlideEvents = function () {
        var e = this;
        e.$list.off("mouseenter.slick", c.proxy(e.interrupt, e, !0)), e.$list.off("mouseleave.slick", c.proxy(e.interrupt, e, !1))
    }, l.prototype.cleanUpRows = function () {
        var e, i = this;
        1 < i.options.rows && ((e = i.$slides.children().children()).removeAttr("style"), i.$slider.empty().append(e))
    }, l.prototype.clickHandler = function (e) {
        !1 === this.shouldClick && (e.stopImmediatePropagation(), e.stopPropagation(), e.preventDefault())
    }, l.prototype.destroy = function (e) {
        var i = this;
        i.autoPlayClear(), i.touchObject = {}, i.cleanUpEvents(), c(".slick-cloned", i.$slider).detach(), i.$dots && i.$dots.remove(), i.$prevArrow && i.$prevArrow.length && (i.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), i.htmlExpr.test(i.options.prevArrow) && i.$prevArrow.remove()), i.$nextArrow && i.$nextArrow.length && (i.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), i.htmlExpr.test(i.options.nextArrow) && i.$nextArrow.remove()), i.$slides && (i.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function () {
            c(this).attr("style", c(this).data("originalStyling"))
        }), i.$slideTrack.children(this.options.slide).detach(), i.$slideTrack.detach(), i.$list.detach(), i.$slider.append(i.$slides)), i.cleanUpRows(), i.$slider.removeClass("slick-slider"), i.$slider.removeClass("slick-initialized"), i.$slider.removeClass("slick-dotted"), i.unslicked = !0, e || i.$slider.trigger("destroy", [i])
    }, l.prototype.disableTransition = function (e) {
        var i = this,
            t = {};
        t[i.transitionType] = "", !1 === i.options.fade ? i.$slideTrack.css(t) : i.$slides.eq(e).css(t)
    }, l.prototype.fadeSlide = function (e, i) {
        var t = this;
        !1 === t.cssTransitions ? (t.$slides.eq(e).css({
            zIndex: t.options.zIndex
        }), t.$slides.eq(e).animate({
            opacity: 1
        }, t.options.speed, t.options.easing, i)) : (t.applyTransition(e), t.$slides.eq(e).css({
            opacity: 1,
            zIndex: t.options.zIndex
        }), i && setTimeout(function () {
            t.disableTransition(e), i.call()
        }, t.options.speed))
    }, l.prototype.fadeSlideOut = function (e) {
        var i = this;
        !1 === i.cssTransitions ? i.$slides.eq(e).animate({
            opacity: 0,
            zIndex: i.options.zIndex - 2
        }, i.options.speed, i.options.easing) : (i.applyTransition(e), i.$slides.eq(e).css({
            opacity: 0,
            zIndex: i.options.zIndex - 2
        }))
    }, l.prototype.filterSlides = l.prototype.slickFilter = function (e) {
        var i = this;
        null !== e && (i.$slidesCache = i.$slides, i.unload(), i.$slideTrack.children(this.options.slide).detach(), i.$slidesCache.filter(e).appendTo(i.$slideTrack), i.reinit())
    }, l.prototype.focusHandler = function () {
        var t = this;
        t.$slider.off("focus.slick blur.slick").on("focus.slick blur.slick", "*:not(.slick-arrow)", function (e) {
            e.stopImmediatePropagation();
            var i = c(this);
            setTimeout(function () {
                t.options.pauseOnFocus && (t.focussed = i.is(":focus"), t.autoPlay())
            }, 0)
        })
    }, l.prototype.getCurrent = l.prototype.slickCurrentSlide = function () {
        return this.currentSlide
    }, l.prototype.getDotCount = function () {
        var e = this,
            i = 0,
            t = 0,
            o = 0;
        if (!0 === e.options.infinite)
            for (; i < e.slideCount;)++o, i = t + e.options.slidesToScroll, t += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        else if (!0 === e.options.centerMode) o = e.slideCount;
        else if (e.options.asNavFor)
            for (; i < e.slideCount;)++o, i = t + e.options.slidesToScroll, t += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow;
        else o = 1 + Math.ceil((e.slideCount - e.options.slidesToShow) / e.options.slidesToScroll);
        return o - 1
    }, l.prototype.getLeft = function (e) {
        var i, t, o, s = this,
            n = 0;
        return s.slideOffset = 0, t = s.$slides.first().outerHeight(!0), !0 === s.options.infinite ? (s.slideCount > s.options.slidesToShow && (s.slideOffset = s.slideWidth * s.options.slidesToShow * -1, n = t * s.options.slidesToShow * -1), s.slideCount % s.options.slidesToScroll != 0 && e + s.options.slidesToScroll > s.slideCount && s.slideCount > s.options.slidesToShow && (e > s.slideCount ? (s.slideOffset = (s.options.slidesToShow - (e - s.slideCount)) * s.slideWidth * -1, n = (s.options.slidesToShow - (e - s.slideCount)) * t * -1) : (s.slideOffset = s.slideCount % s.options.slidesToScroll * s.slideWidth * -1, n = s.slideCount % s.options.slidesToScroll * t * -1))) : e + s.options.slidesToShow > s.slideCount && (s.slideOffset = (e + s.options.slidesToShow - s.slideCount) * s.slideWidth, n = (e + s.options.slidesToShow - s.slideCount) * t), s.slideCount <= s.options.slidesToShow && (n = s.slideOffset = 0), !0 === s.options.centerMode && !0 === s.options.infinite ? s.slideOffset += s.slideWidth * Math.floor(s.options.slidesToShow / 2) - s.slideWidth : !0 === s.options.centerMode && (s.slideOffset = 0, s.slideOffset += s.slideWidth * Math.floor(s.options.slidesToShow / 2)), i = !1 === s.options.vertical ? e * s.slideWidth * -1 + s.slideOffset : e * t * -1 + n, !0 === s.options.variableWidth && (o = s.slideCount <= s.options.slidesToShow || !1 === s.options.infinite ? s.$slideTrack.children(".slick-slide").eq(e) : s.$slideTrack.children(".slick-slide").eq(e + s.options.slidesToShow), i = !0 === s.options.rtl ? o[0] ? -1 * (s.$slideTrack.width() - o[0].offsetLeft - o.width()) : 0 : o[0] ? -1 * o[0].offsetLeft : 0, !0 === s.options.centerMode && (o = s.slideCount <= s.options.slidesToShow || !1 === s.options.infinite ? s.$slideTrack.children(".slick-slide").eq(e) : s.$slideTrack.children(".slick-slide").eq(e + s.options.slidesToShow + 1), i = !0 === s.options.rtl ? o[0] ? -1 * (s.$slideTrack.width() - o[0].offsetLeft - o.width()) : 0 : o[0] ? -1 * o[0].offsetLeft : 0, i += (s.$list.width() - o.outerWidth()) / 2)), i
    }, l.prototype.getOption = l.prototype.slickGetOption = function (e) {
        return this.options[e]
    }, l.prototype.getNavigableIndexes = function () {
        var e, i = this,
            t = 0,
            o = 0,
            s = [];
        for (!1 === i.options.infinite ? e = i.slideCount : (t = -1 * i.options.slidesToScroll, o = -1 * i.options.slidesToScroll, e = 2 * i.slideCount); t < e;) s.push(t), t = o + i.options.slidesToScroll, o += i.options.slidesToScroll <= i.options.slidesToShow ? i.options.slidesToScroll : i.options.slidesToShow;
        return s
    }, l.prototype.getSlick = function () {
        return this
    }, l.prototype.getSlideCount = function () {
        var t, o, s = this;
        return o = !0 === s.options.centerMode ? s.slideWidth * Math.floor(s.options.slidesToShow / 2) : 0, !0 === s.options.swipeToSlide ? (s.$slideTrack.find(".slick-slide").each(function (e, i) {
            if (i.offsetLeft - o + c(i).outerWidth() / 2 > -1 * s.swipeLeft) return t = i, !1
        }), Math.abs(c(t).attr("data-slick-index") - s.currentSlide) || 1) : s.options.slidesToScroll
    }, l.prototype.goTo = l.prototype.slickGoTo = function (e, i) {
        this.changeSlide({
            data: {
                message: "index",
                index: parseInt(e)
            }
        }, i)
    }, l.prototype.init = function (e) {
        var i = this;
        c(i.$slider).hasClass("slick-initialized") || (c(i.$slider).addClass("slick-initialized"), i.buildRows(), i.buildOut(), i.setProps(), i.startLoad(), i.loadSlider(), i.initializeEvents(), i.updateArrows(), i.updateDots(), i.checkResponsive(!0), i.focusHandler()), e && i.$slider.trigger("init", [i]), !0 === i.options.accessibility && i.initADA(), i.options.autoplay && (i.paused = !1, i.autoPlay())
    }, l.prototype.initADA = function () {
        var i = this;
        i.$slides.add(i.$slideTrack.find(".slick-cloned")).attr({
            "aria-hidden": "true",
            tabindex: "-1"
        }).find("a, input, button, select").attr({
            tabindex: "-1"
        }), i.$slideTrack.attr("role", "listbox"), i.$slides.not(i.$slideTrack.find(".slick-cloned")).each(function (e) {
            c(this).attr({
                role: "option",
                "aria-describedby": "slick-slide" + i.instanceUid + e
            })
        }), null !== i.$dots && i.$dots.attr("role", "tablist").find("li").each(function (e) {
            c(this).attr({
                role: "presentation",
                "aria-selected": "false",
                "aria-controls": "navigation" + i.instanceUid + e,
                id: "slick-slide" + i.instanceUid + e
            })
        }).first().attr("aria-selected", "true").end().find("button").attr("role", "button").end().closest("div").attr("role", "toolbar"), i.activateADA()
    }, l.prototype.initArrowEvents = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.off("click.slick").on("click.slick", {
            message: "previous"
        }, e.changeSlide), e.$nextArrow.off("click.slick").on("click.slick", {
            message: "next"
        }, e.changeSlide))
    }, l.prototype.initDotEvents = function () {
        var e = this;
        !0 === e.options.dots && e.slideCount > e.options.slidesToShow && c("li", e.$dots).on("click.slick", {
            message: "index"
        }, e.changeSlide), !0 === e.options.dots && !0 === e.options.pauseOnDotsHover && c("li", e.$dots).on("mouseenter.slick", c.proxy(e.interrupt, e, !0)).on("mouseleave.slick", c.proxy(e.interrupt, e, !1))
    }, l.prototype.initSlideEvents = function () {
        var e = this;
        e.options.pauseOnHover && (e.$list.on("mouseenter.slick", c.proxy(e.interrupt, e, !0)), e.$list.on("mouseleave.slick", c.proxy(e.interrupt, e, !1)))
    }, l.prototype.initializeEvents = function () {
        var e = this;
        e.initArrowEvents(), e.initDotEvents(), e.initSlideEvents(), e.$list.on("touchstart.slick mousedown.slick", {
            action: "start"
        }, e.swipeHandler), e.$list.on("touchmove.slick mousemove.slick", {
            action: "move"
        }, e.swipeHandler), e.$list.on("touchend.slick mouseup.slick", {
            action: "end"
        }, e.swipeHandler), e.$list.on("touchcancel.slick mouseleave.slick", {
            action: "end"
        }, e.swipeHandler), e.$list.on("click.slick", e.clickHandler), c(document).on(e.visibilityChange, c.proxy(e.visibility, e)), !0 === e.options.accessibility && e.$list.on("keydown.slick", e.keyHandler), !0 === e.options.focusOnSelect && c(e.$slideTrack).children().on("click.slick", e.selectHandler), c(window).on("orientationchange.slick.slick-" + e.instanceUid, c.proxy(e.orientationChange, e)), c(window).on("resize.slick.slick-" + e.instanceUid, c.proxy(e.resize, e)), c("[draggable!=true]", e.$slideTrack).on("dragstart", e.preventDefault), c(window).on("load.slick.slick-" + e.instanceUid, e.setPosition), c(document).on("ready.slick.slick-" + e.instanceUid, e.setPosition)
    }, l.prototype.initUI = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.show(), e.$nextArrow.show()), !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.show()
    }, l.prototype.keyHandler = function (e) {
        var i = this;
        e.target.tagName.match("TEXTAREA|INPUT|SELECT") || (37 === e.keyCode && !0 === i.options.accessibility ? i.changeSlide({
            data: {
                message: !0 === i.options.rtl ? "next" : "previous"
            }
        }) : 39 === e.keyCode && !0 === i.options.accessibility && i.changeSlide({
            data: {
                message: !0 === i.options.rtl ? "previous" : "next"
            }
        }))
    }, l.prototype.lazyLoad = function () {
        function e(e) {
            c("img[data-lazy]", e).each(function () {
                var e = c(this),
                    i = c(this).attr("data-lazy"),
                    t = document.createElement("img");
                t.onload = function () {
                    e.animate({
                        opacity: 0
                    }, 100, function () {
                        e.attr("src", i).animate({
                            opacity: 1
                        }, 200, function () {
                            e.removeAttr("data-lazy").removeClass("slick-loading")
                        }), o.$slider.trigger("lazyLoaded", [o, e, i])
                    })
                }, t.onerror = function () {
                    e.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), o.$slider.trigger("lazyLoadError", [o, e, i])
                }, t.src = i
            })
        }
        var i, t, o = this;
        !0 === o.options.centerMode ? !0 === o.options.infinite ? t = (i = o.currentSlide + (o.options.slidesToShow / 2 + 1)) + o.options.slidesToShow + 2 : (i = Math.max(0, o.currentSlide - (o.options.slidesToShow / 2 + 1)), t = o.options.slidesToShow / 2 + 1 + 2 + o.currentSlide) : (i = o.options.infinite ? o.options.slidesToShow + o.currentSlide : o.currentSlide, t = Math.ceil(i + o.options.slidesToShow), !0 === o.options.fade && (0 < i && i--, t <= o.slideCount && t++)), e(o.$slider.find(".slick-slide").slice(i, t)), o.slideCount <= o.options.slidesToShow ? e(o.$slider.find(".slick-slide")) : o.currentSlide >= o.slideCount - o.options.slidesToShow ? e(o.$slider.find(".slick-cloned").slice(0, o.options.slidesToShow)) : 0 === o.currentSlide && e(o.$slider.find(".slick-cloned").slice(-1 * o.options.slidesToShow))
    }, l.prototype.loadSlider = function () {
        var e = this;
        e.setPosition(), e.$slideTrack.css({
            opacity: 1
        }), e.$slider.removeClass("slick-loading"), e.initUI(), "progressive" === e.options.lazyLoad && e.progressiveLazyLoad()
    }, l.prototype.next = l.prototype.slickNext = function () {
        this.changeSlide({
            data: {
                message: "next"
            }
        })
    }, l.prototype.orientationChange = function () {
        var e = this;
        e.checkResponsive(), e.setPosition()
    }, l.prototype.pause = l.prototype.slickPause = function () {
        var e = this;
        e.autoPlayClear(), e.paused = !0
    }, l.prototype.play = l.prototype.slickPlay = function () {
        var e = this;
        e.autoPlay(), e.options.autoplay = !0, e.paused = !1, e.focussed = !1, e.interrupted = !1
    }, l.prototype.postSlide = function (e) {
        var i = this;
        i.unslicked || (i.$slider.trigger("afterChange", [i, e]), i.animating = !1, i.setPosition(), i.swipeLeft = null, i.options.autoplay && i.autoPlay(), !0 === i.options.accessibility && i.initADA())
    }, l.prototype.prev = l.prototype.slickPrev = function () {
        this.changeSlide({
            data: {
                message: "previous"
            }
        })
    }, l.prototype.preventDefault = function (e) {
        e.preventDefault()
    }, l.prototype.progressiveLazyLoad = function (e) {
        e = e || 1;
        var i, t, o, s = this,
            n = c("img[data-lazy]", s.$slider);
        n.length ? (i = n.first(), t = i.attr("data-lazy"), (o = document.createElement("img")).onload = function () {
            i.attr("src", t).removeAttr("data-lazy").removeClass("slick-loading"), !0 === s.options.adaptiveHeight && s.setPosition(), s.$slider.trigger("lazyLoaded", [s, i, t]), s.progressiveLazyLoad()
        }, o.onerror = function () {
            e < 3 ? setTimeout(function () {
                s.progressiveLazyLoad(e + 1)
            }, 500) : (i.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), s.$slider.trigger("lazyLoadError", [s, i, t]), s.progressiveLazyLoad())
        }, o.src = t) : s.$slider.trigger("allImagesLoaded", [s])
    }, l.prototype.refresh = function (e) {
        var i, t, o = this;
        t = o.slideCount - o.options.slidesToShow, !o.options.infinite && o.currentSlide > t && (o.currentSlide = t), o.slideCount <= o.options.slidesToShow && (o.currentSlide = 0), i = o.currentSlide, o.destroy(!0), c.extend(o, o.initials, {
            currentSlide: i
        }), o.init(), e || o.changeSlide({
            data: {
                message: "index",
                index: i
            }
        }, !1)
    }, l.prototype.registerBreakpoints = function () {
        var e, i, t, o = this,
            s = o.options.responsive || null;
        if ("array" === c.type(s) && s.length) {
            for (e in o.respondTo = o.options.respondTo || "window", s)
                if (t = o.breakpoints.length - 1, i = s[e].breakpoint, s.hasOwnProperty(e)) {
                    for (; 0 <= t;) o.breakpoints[t] && o.breakpoints[t] === i && o.breakpoints.splice(t, 1), t--;
                    o.breakpoints.push(i), o.breakpointSettings[i] = s[e].settings
                }
            o.breakpoints.sort(function (e, i) {
                return o.options.mobileFirst ? e - i : i - e
            })
        }
    }, l.prototype.reinit = function () {
        var e = this;
        e.$slides = e.$slideTrack.children(e.options.slide).addClass("slick-slide"), e.slideCount = e.$slides.length, e.currentSlide >= e.slideCount && 0 !== e.currentSlide && (e.currentSlide = e.currentSlide - e.options.slidesToScroll), e.slideCount <= e.options.slidesToShow && (e.currentSlide = 0), e.registerBreakpoints(), e.setProps(), e.setupInfinite(), e.buildArrows(), e.updateArrows(), e.initArrowEvents(), e.buildDots(), e.updateDots(), e.initDotEvents(), e.cleanUpSlideEvents(), e.initSlideEvents(), e.checkResponsive(!1, !0), !0 === e.options.focusOnSelect && c(e.$slideTrack).children().on("click.slick", e.selectHandler), e.setSlideClasses("number" == typeof e.currentSlide ? e.currentSlide : 0), e.setPosition(), e.focusHandler(), e.paused = !e.options.autoplay, e.autoPlay(), e.$slider.trigger("reInit", [e])
    }, l.prototype.resize = function () {
        var e = this;
        c(window).width() !== e.windowWidth && (clearTimeout(e.windowDelay), e.windowDelay = window.setTimeout(function () {
            e.windowWidth = c(window).width(), e.checkResponsive(), e.unslicked || e.setPosition()
        }, 50))
    }, l.prototype.removeSlide = l.prototype.slickRemove = function (e, i, t) {
        var o = this;
        if (e = "boolean" == typeof e ? !0 === (i = e) ? 0 : o.slideCount - 1 : !0 === i ? --e : e, o.slideCount < 1 || e < 0 || e > o.slideCount - 1) return !1;
        o.unload(), !0 === t ? o.$slideTrack.children().remove() : o.$slideTrack.children(this.options.slide).eq(e).remove(), o.$slides = o.$slideTrack.children(this.options.slide), o.$slideTrack.children(this.options.slide).detach(), o.$slideTrack.append(o.$slides), o.$slidesCache = o.$slides, o.reinit()
    }, l.prototype.setCSS = function (e) {
        var i, t, o = this,
            s = {};
        !0 === o.options.rtl && (e = -e), i = "left" == o.positionProp ? Math.ceil(e) + "px" : "0px", t = "top" == o.positionProp ? Math.ceil(e) + "px" : "0px", s[o.positionProp] = e, !1 === o.transformsEnabled || (!(s = {}) === o.cssTransitions ? s[o.animType] = "translate(" + i + ", " + t + ")" : s[o.animType] = "translate3d(" + i + ", " + t + ", 0px)"), o.$slideTrack.css(s)
    }, l.prototype.setDimensions = function () {
        var e = this;
        !1 === e.options.vertical ? !0 === e.options.centerMode && e.$list.css({
            padding: "0px " + e.options.centerPadding
        }) : (e.$list.height(e.$slides.first().outerHeight(!0) * e.options.slidesToShow), !0 === e.options.centerMode && e.$list.css({
            padding: e.options.centerPadding + " 0px"
        })), e.listWidth = e.$list.width(), e.listHeight = e.$list.height(), !1 === e.options.vertical && !1 === e.options.variableWidth ? (e.slideWidth = Math.ceil(e.listWidth / e.options.slidesToShow), e.$slideTrack.width(Math.ceil(e.slideWidth * e.$slideTrack.children(".slick-slide").length))) : !0 === e.options.variableWidth ? e.$slideTrack.width(5e3 * e.slideCount) : (e.slideWidth = Math.ceil(e.listWidth), e.$slideTrack.height(Math.ceil(e.$slides.first().outerHeight(!0) * e.$slideTrack.children(".slick-slide").length)));
        var i = e.$slides.first().outerWidth(!0) - e.$slides.first().width();
        !1 === e.options.variableWidth && e.$slideTrack.children(".slick-slide").width(e.slideWidth - i)
    }, l.prototype.setFade = function () {
        var t, o = this;
        o.$slides.each(function (e, i) {
            t = o.slideWidth * e * -1, !0 === o.options.rtl ? c(i).css({
                position: "relative",
                right: t,
                top: 0,
                zIndex: o.options.zIndex - 2,
                opacity: 0
            }) : c(i).css({
                position: "relative",
                left: t,
                top: 0,
                zIndex: o.options.zIndex - 2,
                opacity: 0
            })
        }), o.$slides.eq(o.currentSlide).css({
            zIndex: o.options.zIndex - 1,
            opacity: 1
        })
    }, l.prototype.setHeight = function () {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight && !1 === e.options.vertical) {
            var i = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.css("height", i)
        }
    }, l.prototype.setOption = l.prototype.slickSetOption = function (e, i, t) {
        var o, s, n, r, l, a = this,
            d = !1;
        if ("object" === c.type(e) ? (n = arguments[0], d = i, l = "multiple") : "string" === c.type(arguments[0]) && (n = arguments[0], r = arguments[1], d = t, "responsive" === arguments[0] && "array" === c.type(arguments[1]) ? l = "responsive" : "undefined" != typeof arguments[1] && (l = "single")), "single" === l) a.options[n] = r;
        else if ("multiple" === l) c.each(n, function (e, i) {
            a.options[e] = i
        });
        else if ("responsive" === l)
            for (s in r)
                if ("array" !== c.type(a.options.responsive)) a.options.responsive = [r[s]];
                else {
                    for (o = a.options.responsive.length - 1; 0 <= o;) a.options.responsive[o].breakpoint === r[s].breakpoint && a.options.responsive.splice(o, 1), o--;
                    a.options.responsive.push(r[s])
                }
        d && (a.unload(), a.reinit())
    }, l.prototype.setPosition = function () {
        var e = this;
        e.setDimensions(), e.setHeight(), !1 === e.options.fade ? e.setCSS(e.getLeft(e.currentSlide)) : e.setFade(), e.$slider.trigger("setPosition", [e])
    }, l.prototype.setProps = function () {
        var e = this,
            i = document.body.style;
        e.positionProp = !0 === e.options.vertical ? "top" : "left", "top" === e.positionProp ? e.$slider.addClass("slick-vertical") : e.$slider.removeClass("slick-vertical"), i.WebkitTransition === undefined && i.MozTransition === undefined && i.msTransition === undefined || !0 === e.options.useCSS && (e.cssTransitions = !0), e.options.fade && ("number" == typeof e.options.zIndex ? e.options.zIndex < 3 && (e.options.zIndex = 3) : e.options.zIndex = e.defaults.zIndex), i.OTransform !== undefined && (e.animType = "OTransform", e.transformType = "-o-transform", e.transitionType = "OTransition", i.perspectiveProperty === undefined && i.webkitPerspective === undefined && (e.animType = !1)), i.MozTransform !== undefined && (e.animType = "MozTransform", e.transformType = "-moz-transform", e.transitionType = "MozTransition", i.perspectiveProperty === undefined && i.MozPerspective === undefined && (e.animType = !1)), i.webkitTransform !== undefined && (e.animType = "webkitTransform", e.transformType = "-webkit-transform", e.transitionType = "webkitTransition", i.perspectiveProperty === undefined && i.webkitPerspective === undefined && (e.animType = !1)), i.msTransform !== undefined && (e.animType = "msTransform", e.transformType = "-ms-transform", e.transitionType = "msTransition", i.msTransform === undefined && (e.animType = !1)), i.transform !== undefined && !1 !== e.animType && (e.animType = "transform", e.transformType = "transform", e.transitionType = "transition"), e.transformsEnabled = e.options.useTransform && null !== e.animType && !1 !== e.animType
    }, l.prototype.setSlideClasses = function (e) {
        var i, t, o, s, n = this;
        t = n.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden", "true"), n.$slides.eq(e).addClass("slick-current"), !0 === n.options.centerMode ? (i = Math.floor(n.options.slidesToShow / 2), !0 === n.options.infinite && (i <= e && e <= n.slideCount - 1 - i ? n.$slides.slice(e - i, e + i + 1).addClass("slick-active").attr("aria-hidden", "false") : (o = n.options.slidesToShow + e, t.slice(o - i + 1, o + i + 2).addClass("slick-active").attr("aria-hidden", "false")), 0 === e ? t.eq(t.length - 1 - n.options.slidesToShow).addClass("slick-center") : e === n.slideCount - 1 && t.eq(n.options.slidesToShow).addClass("slick-center")), n.$slides.eq(e).addClass("slick-center")) : 0 <= e && e <= n.slideCount - n.options.slidesToShow ? n.$slides.slice(e, e + n.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false") : t.length <= n.options.slidesToShow ? t.addClass("slick-active").attr("aria-hidden", "false") : (s = n.slideCount % n.options.slidesToShow, o = !0 === n.options.infinite ? n.options.slidesToShow + e : e, n.options.slidesToShow == n.options.slidesToScroll && n.slideCount - e < n.options.slidesToShow ? t.slice(o - (n.options.slidesToShow - s), o + s).addClass("slick-active").attr("aria-hidden", "false") : t.slice(o, o + n.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false")),
            "ondemand" === n.options.lazyLoad && n.lazyLoad()
    }, l.prototype.setupInfinite = function () {
        var e, i, t, o = this;
        if (!0 === o.options.fade && (o.options.centerMode = !1), !0 === o.options.infinite && !1 === o.options.fade && (i = null, o.slideCount > o.options.slidesToShow)) {
            for (t = !0 === o.options.centerMode ? o.options.slidesToShow + 1 : o.options.slidesToShow, e = o.slideCount; e > o.slideCount - t; e -= 1) i = e - 1, c(o.$slides[i]).clone(!0).attr("id", "").attr("data-slick-index", i - o.slideCount).prependTo(o.$slideTrack).addClass("slick-cloned");
            for (e = 0; e < t; e += 1) i = e, c(o.$slides[i]).clone(!0).attr("id", "").attr("data-slick-index", i + o.slideCount).appendTo(o.$slideTrack).addClass("slick-cloned");
            o.$slideTrack.find(".slick-cloned").find("[id]").each(function () {
                c(this).attr("id", "")
            })
        }
    }, l.prototype.interrupt = function (e) {
        var i = this;
        e || i.autoPlay(), i.interrupted = e
    }, l.prototype.selectHandler = function (e) {
        var i = this,
            t = c(e.target).is(".slick-slide") ? c(e.target) : c(e.target).parents(".slick-slide"),
            o = parseInt(t.attr("data-slick-index"));
        if (o || (o = 0), i.slideCount <= i.options.slidesToShow) return i.setSlideClasses(o), void i.asNavFor(o);
        i.slideHandler(o)
    }, l.prototype.slideHandler = function (e, i, t) {
        var o, s, n, r, l, a = null,
            d = this;
        if (i = i || !1, (!0 !== d.animating || !0 !== d.options.waitForAnimate) && !(!0 === d.options.fade && d.currentSlide === e || d.slideCount <= d.options.slidesToShow))
            if (!1 === i && d.asNavFor(e), o = e, a = d.getLeft(o), r = d.getLeft(d.currentSlide), d.currentLeft = null === d.swipeLeft ? r : d.swipeLeft, !1 === d.options.infinite && !1 === d.options.centerMode && (e < 0 || e > d.getDotCount() * d.options.slidesToScroll))!1 === d.options.fade && (o = d.currentSlide, !0 !== t ? d.animateSlide(r, function () {
                d.postSlide(o)
            }) : d.postSlide(o));
            else if (!1 === d.options.infinite && !0 === d.options.centerMode && (e < 0 || e > d.slideCount - d.options.slidesToScroll))!1 === d.options.fade && (o = d.currentSlide, !0 !== t ? d.animateSlide(r, function () {
            d.postSlide(o)
        }) : d.postSlide(o));
        else {
            if (d.options.autoplay && clearInterval(d.autoPlayTimer), s = o < 0 ? d.slideCount % d.options.slidesToScroll != 0 ? d.slideCount - d.slideCount % d.options.slidesToScroll : d.slideCount + o : o >= d.slideCount ? d.slideCount % d.options.slidesToScroll != 0 ? 0 : o - d.slideCount : o, d.animating = !0, d.$slider.trigger("beforeChange", [d, d.currentSlide, s]), n = d.currentSlide, d.currentSlide = s, d.setSlideClasses(d.currentSlide), d.options.asNavFor && (l = (l = d.getNavTarget()).slick("getSlick")).slideCount <= l.options.slidesToShow && l.setSlideClasses(d.currentSlide), d.updateDots(), d.updateArrows(), !0 === d.options.fade) return !0 !== t ? (d.fadeSlideOut(n), d.fadeSlide(s, function () {
                d.postSlide(s)
            })) : d.postSlide(s), void d.animateHeight();
            !0 !== t ? d.animateSlide(a, function () {
                d.postSlide(s)
            }) : d.postSlide(s)
        }
    }, l.prototype.startLoad = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.hide(), e.$nextArrow.hide()), !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.hide(), e.$slider.addClass("slick-loading")
    }, l.prototype.swipeDirection = function () {
        var e, i, t, o, s = this;
        return e = s.touchObject.startX - s.touchObject.curX, i = s.touchObject.startY - s.touchObject.curY, t = Math.atan2(i, e), (o = Math.round(180 * t / Math.PI)) < 0 && (o = 360 - Math.abs(o)), o <= 45 && 0 <= o ? !1 === s.options.rtl ? "left" : "right" : o <= 360 && 315 <= o ? !1 === s.options.rtl ? "left" : "right" : 135 <= o && o <= 225 ? !1 === s.options.rtl ? "right" : "left" : !0 === s.options.verticalSwiping ? 35 <= o && o <= 135 ? "down" : "up" : "vertical"
    }, l.prototype.swipeEnd = function () {
        var e, i, t = this;
        if (t.dragging = !1, t.interrupted = !1, t.shouldClick = !(10 < t.touchObject.swipeLength), t.touchObject.curX === undefined) return !1;
        if (!0 === t.touchObject.edgeHit && t.$slider.trigger("edge", [t, t.swipeDirection()]), t.touchObject.swipeLength >= t.touchObject.minSwipe) {
            switch (i = t.swipeDirection()) {
            case "left":
            case "down":
                e = t.options.swipeToSlide ? t.checkNavigable(t.currentSlide + t.getSlideCount()) : t.currentSlide + t.getSlideCount(), t.currentDirection = 0;
                break;
            case "right":
            case "up":
                e = t.options.swipeToSlide ? t.checkNavigable(t.currentSlide - t.getSlideCount()) : t.currentSlide - t.getSlideCount(), t.currentDirection = 1
            }
            "vertical" != i && (t.slideHandler(e), t.touchObject = {}, t.$slider.trigger("swipe", [t, i]))
        } else t.touchObject.startX !== t.touchObject.curX && (t.slideHandler(t.currentSlide), t.touchObject = {})
    }, l.prototype.swipeHandler = function (e) {
        var i = this;
        if (!(!1 === i.options.swipe || "ontouchend" in document && !1 === i.options.swipe || !1 === i.options.draggable && -1 !== e.type.indexOf("mouse"))) switch (i.touchObject.fingerCount = e.originalEvent && e.originalEvent.touches !== undefined ? e.originalEvent.touches.length : 1, i.touchObject.minSwipe = i.listWidth / i.options.touchThreshold, !0 === i.options.verticalSwiping && (i.touchObject.minSwipe = i.listHeight / i.options.touchThreshold), e.data.action) {
        case "start":
            i.swipeStart(e);
            break;
        case "move":
            i.swipeMove(e);
            break;
        case "end":
            i.swipeEnd(e)
        }
    }, l.prototype.swipeMove = function (e) {
        var i, t, o, s, n, r = this;
        return n = e.originalEvent !== undefined ? e.originalEvent.touches : null, !(!r.dragging || n && 1 !== n.length) && (i = r.getLeft(r.currentSlide), r.touchObject.curX = n !== undefined ? n[0].pageX : e.clientX, r.touchObject.curY = n !== undefined ? n[0].pageY : e.clientY, r.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(r.touchObject.curX - r.touchObject.startX, 2))), !0 === r.options.verticalSwiping && (r.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(r.touchObject.curY - r.touchObject.startY, 2)))), "vertical" !== (t = r.swipeDirection()) ? (e.originalEvent !== undefined && 4 < r.touchObject.swipeLength && e.preventDefault(), s = (!1 === r.options.rtl ? 1 : -1) * (r.touchObject.curX > r.touchObject.startX ? 1 : -1), !0 === r.options.verticalSwiping && (s = r.touchObject.curY > r.touchObject.startY ? 1 : -1), o = r.touchObject.swipeLength, (r.touchObject.edgeHit = !1) === r.options.infinite && (0 === r.currentSlide && "right" === t || r.currentSlide >= r.getDotCount() && "left" === t) && (o = r.touchObject.swipeLength * r.options.edgeFriction, r.touchObject.edgeHit = !0), !1 === r.options.vertical ? r.swipeLeft = i + o * s : r.swipeLeft = i + o * (r.$list.height() / r.listWidth) * s, !0 === r.options.verticalSwiping && (r.swipeLeft = i + o * s), !0 !== r.options.fade && !1 !== r.options.touchMove && (!0 === r.animating ? (r.swipeLeft = null, !1) : void r.setCSS(r.swipeLeft))) : void 0)
    }, l.prototype.swipeStart = function (e) {
        var i, t = this;
        if (t.interrupted = !0, 1 !== t.touchObject.fingerCount || t.slideCount <= t.options.slidesToShow) return !(t.touchObject = {});
        e.originalEvent !== undefined && e.originalEvent.touches !== undefined && (i = e.originalEvent.touches[0]), t.touchObject.startX = t.touchObject.curX = i !== undefined ? i.pageX : e.clientX, t.touchObject.startY = t.touchObject.curY = i !== undefined ? i.pageY : e.clientY, t.dragging = !0
    }, l.prototype.unfilterSlides = l.prototype.slickUnfilter = function () {
        var e = this;
        null !== e.$slidesCache && (e.unload(), e.$slideTrack.children(this.options.slide).detach(), e.$slidesCache.appendTo(e.$slideTrack), e.reinit())
    }, l.prototype.unload = function () {
        var e = this;
        c(".slick-cloned", e.$slider).remove(), e.$dots && e.$dots.remove(), e.$prevArrow && e.htmlExpr.test(e.options.prevArrow) && e.$prevArrow.remove(), e.$nextArrow && e.htmlExpr.test(e.options.nextArrow) && e.$nextArrow.remove(), e.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden", "true").css("width", "")
    }, l.prototype.unslick = function (e) {
        var i = this;
        i.$slider.trigger("unslick", [i, e]), i.destroy()
    }, l.prototype.updateArrows = function () {
        var e = this;
        Math.floor(e.options.slidesToShow / 2), !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && !e.options.infinite && (e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), 0 === e.currentSlide ? (e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - e.options.slidesToShow && !1 === e.options.centerMode ? (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - 1 && !0 === e.options.centerMode && (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")))
    }, l.prototype.updateDots = function () {
        var e = this;
        null !== e.$dots && (e.$dots.find("li").removeClass("slick-active").attr("aria-hidden", "true"), e.$dots.find("li").eq(Math.floor(e.currentSlide / e.options.slidesToScroll)).addClass("slick-active").attr("aria-hidden", "false"))
    }, l.prototype.visibility = function () {
        var e = this;
        e.options.autoplay && (document[e.hidden] ? e.interrupted = !0 : e.interrupted = !1)
    }, c.fn.slick = function (e) {
        var i, t, o = this,
            s = e,
            n = Array.prototype.slice.call(arguments, 1),
            r = o.length;
        for (i = 0; i < r; i++)
            if ("object" == typeof s || void 0 === s ? o[i].slick = new l(o[i], s) : t = o[i].slick[s].apply(o[i].slick, n), void 0 !== t) return t;
        return o
    }
}),
function () {
    var s;
    MC.homePageRefresh = s = {
        mcBpSmall: 768,
        slider: $(".slides"),
        slideItems: $(".thumbs .row"),
        setSlickSlider: function () {
            return s.slider.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: !1,
                fade: !0,
                draggable: !1,
                swipe: !1,
                autoplay: !0,
                autoplaySpeed: 6e3,
                asNavFor: ".thumbs .row",
                waitForAnimate: !1,
                responsive: [{
                    breakpoint: 768,
                    settings: {
                        swipe: !0,
                        autoplay: !0,
                        infinite: !0
                    }
                }]
            }), s.slideItems.slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: ".slides",
                centerMode: !0,
                centerPadding: 0,
                draggable: !1,
                waitForAnimate: !1,
                swipe: !1,
                prevArrow: '<span class="mc-arrow  mc-arrow-left" onclick="arrow_left()">Previous</span>',
                nextArrow: '<span class="mc-arrow  mc-arrow-right" onclick="arrow_right()">Next</span>',
                rows: 1,
                responsive: [{
                    breakpoint: 768,
                    settings: {
                        slidesToScroll: 1,
                        autoplay: !0,
                        centerMode: !1,
                        infinite: !1
                    }
                }]
            })
        }, checkBreakpoint: function () {
            return window.innerWidth < s.mcBpSmall ? $("body").addClass("mc-bp-small") : $("body").removeClass("mc-bp-small")
        }, watchWindowResize: function () {
            var e;
            return e = !1, $(window).resize(function () {
                return clearTimeout(e), e = setTimeout(function () {
                    return s.taglineTiles()
                }, 350)
            })
        }, taglineTiles: function () {
            return $(".mc-list-classes--experiment .caption-description").each(function () {
                var e;
                return e = $(this).outerHeight(!0), $(this).parent(".caption").css("transform", "translateY(" + e + "px)")
            })
        }, bindEvents: function () {
            return "ontouchstart" in document.documentElement || (document.documentElement.className += " no-touch"), $(window).keydown(function (e) {
                var i, t, o;
                if (t = 37, o = 39, (i = e.which) === t && s.slider.slick("slickPrev"), i === o) return s.slider.slick("slickNext")
            }), $("body").on("click", ".hp_slide_thumb.slick-slide", function () {
                if (window.innerWidth >= s.mcBpSmall) return window.location = "/classes/" + $(this).data("slug")
            }), $(window).resize(function () {
                return s.checkBreakpoint()
            }), $("#browse_class_link").on("click", function () {
                MC.utilities.smoothScroll($("#now-available"), 500)
            }), $('a[href="/#now-available"]').click(function () {
                MC.utilities.smoothScroll($("#now-available"), 500)
            })
        }, experimentWhatsInside: function () {
            if (gon.experiments && gon.experiments.whats_in_an_mc_0318) return MC.segment.track(MC.segment.EventTypes.EXPERIMENT_VIEWED, {
                experimentName: "whats_in_an_mc_0318",
                variationName: gon.experiments.whats_in_an_mc_0318
            })
        }, experimentInstructorAnnouncements: function () {
            return $(".instructor_announcements__slides").slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: !0,
                appendArrows: $(".instructor_announcements__navigation"),
                draggable: !1,
                swipe: !1,
                autoplay: !0,
                autoplaySpeed: 6e3,
                waitForAnimate: !1,
                infinite: !1
            })
        }, init: function () {
            if (MC.utilities.onPage("pages", "root")) return s.checkBreakpoint(), s.setSlickSlider(), s.bindEvents(), s.taglineTiles(), s.watchWindowResize(), s.experimentWhatsInside(), s.experimentInstructorAnnouncements()
        }, ready: function () {
            return s.init()
        }
    }
}.call(this),
    function () {
        var e;
        e = function () {
            return MC.homePageRefresh.ready()
        }, $(document).on("ready", e)
    }.call(this);