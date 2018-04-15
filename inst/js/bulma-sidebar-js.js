function closest(el, selector) {
  var matchesFn;
  
  // find vendor prefix
  [ 'matches', 'webkitMatchesSelector', 'mozMatchesSelector', 'msMatchesSelector', 'oMatchesSelector' ].some( function( fn ) {
    if ( typeof document.body[ fn ] == 'function' ) {
      matchesFn = fn;
      return true;
    }
    return false;
  } );
  
  var parent;
  
  // traverse parents
  while ( el ) {
    parent = el.parentElement;
    if ( parent && parent[ matchesFn ]( selector ) ) {
      return parent;
    }
    el = parent;
  }
  
  return null;
}

document.addEventListener( 'DOMContentLoaded', function () {
  // Get all document sliders
  var showQuickview = document.querySelectorAll( '[data-show="quickview"]' );
  [].forEach.call( showQuickview, function ( show ) {
    var quickview = document.getElementById( show.dataset[ 'target' ] );
    if ( quickview ) {
      // Add event listener to update output when slider value change
      show.addEventListener( 'click', function( event ) {
        quickview.classList.add( 'is-active' );
      } );
    }
  } );
  
  // Get all document sliders
  var dismissQuickView = document.querySelectorAll( '[data-dismiss="quickview"]' );
  [].forEach.call( dismissQuickView, function ( dismiss ) {
    var quickview = closest( dismiss, '.quickview' );
    if ( quickview ) {
      // Add event listener to update output when slider value change
      dismiss.addEventListener( 'click', function( event ) {
        quickview.classList.remove( 'is-active' );
      } );
    }
    
    
  } );
} );