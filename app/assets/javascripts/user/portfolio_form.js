App.UserPortfolioForm = (function() {

  function init(formId) {
    var $form = $('#'+formId);

    function removeFields(link) {
        $(link).parent().remove();
    };

    function addFields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g")
        $(link).parent().before(content.replace(regexp, new_id));
    };

    var addBtn = $form.find('.btn-add');

    $form.on('click', '.btn-add-field', function(e) {
      e.preventDefault();
      var $this = $(this);
      var association = $this.attr('data-association');
      var content = $this.attr('data-content');

      addFields(this, association, content);
    });

    $form.on('click', '.btn-remove-field', function(e) {
      e.preventDefault();

      removeFields(this);
    });
  };

  return {
    init: init
  };
});

$(function() {
  var form = App.UserPortfolioForm().init('new_portfolio');
});
