var navPos = jQuery( '.tabs' ).offset().top; // グローバルメニューの位置
var navHeight = jQuery( '.tabs' ).outerHeight(); // グローバルメニューの高さ
jQuery( window ).on( 'scroll', function() {
  if ( jQuery( this ).scrollTop() > navPos ) {
    jQuery( 'body' ).css( 'padding-top', navHeight );
    jQuery( '.tabs' ).addClass( 'm_fixed' );
  } else {
    jQuery( 'body' ).css( 'padding-top', 0 );
    jQuery( '.tabs' ).removeClass( 'm_fixed' );
  }
});