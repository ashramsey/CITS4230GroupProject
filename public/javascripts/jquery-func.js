function _init_slider(carousel) {
	$('#slider .slider-controls a').bind('click', function() {
		var index = $(this).parent().find('a').index(this) + 1;
		carousel.scroll( index );
		return false;
	});
	
	$('#slider .slider-nav .next').bind('click', function() {
		carousel.next();
		return false;
	});
	
	$('#slider .slider-nav .prev').bind('click', function() {
		carousel.prev();
		return false;
	});
};

function _set_slide(carousel, item, idx, state) {
	var index = idx - 1;
	
	$('#slider .slider-controls a').removeClass('active');
	$('#slider .slider-controls a').eq(index).addClass('active');
};

function check_fields(field) {
	if (field.title==field.value || this.value == '') {
		$(field).removeClass('field-focused');
	} else {
		$(field).addClass('field-focused');
	};
};

$(document).ready(function() {
	$("#slider-holder").jcarousel({
		scroll: 1,
		auto: 5,
		wrap: 'both',
		initCallback: _init_slider,
		itemFirstInCallback: _set_slide,
		buttonNextHTML: null,
		buttonPrevHTML: null
	});
	
	$('.field').each(function() {
		check_fields(this);
	});
	
	$('.field').focus(function() {
        if(this.title==this.value) {
            this.value = '';
            check_fields(this);
        }
    }).blur(function(){
        if(this.value=='') {
            this.value = this.title;
            check_fields(this);
        }
    });
});