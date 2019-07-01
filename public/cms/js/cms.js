/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/assets/js/cms.js":
/*!************************************!*\
  !*** ./resources/assets/js/cms.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

window.urlAjaxHandlerCms = _SERVER_PATH + '/admin/api/'; // percorso  del contenuto del  dialog

window.curItem;

window.Cms = function () {
  function handleBootstrap() {
    $('[data-toggle="tooltip"]').tooltip();
    /*Popovers*/

    jQuery('.popovers').popover();
    jQuery('.popovers-show').popover('show');
    jQuery('.popovers-hide').popover('hide');
    jQuery('.popovers-toggle').popover('toggle');
    jQuery('.popovers-destroy').popover('destroy');
    jQuery('[data-toggle="buttons-radio"]').button();
  }

  function handleToggle() {
    jQuery('.list-toggle').on('click', function () {
      jQuery(this).toggleClass('active');
    });
  } // checkboxes and radio


  function initCheckboxes() {
    $('input[type="checkbox"], input[type="radio"]').change(function () {
      var elem = $(this);

      if (elem.is('input[type="radio"]')) {
        $('input[type="radio"][name="' + elem.attr('name') + '"]').each(function () {
          updateCheckbox($(this));
        });
      } else {
        updateCheckbox($(this));
      }
    }).each(function () {
      updateCheckbox($(this));
    });
  }

  function updateCheckbox(elem) {
    var checked = elem.is(':checked');

    if (checked) {
      elem.closest('.form-checkbox, .form-radio').addClass('checked');
    } else {
      elem.closest('.form-checkbox, .form-radio').removeClass('checked');
    }
  }

  function handleFlashMessage() {
    jQuery('div.flash').not('.alert-important').delay(1500).slideUp();
  }

  function listHandler() {
    $(':input[data-list-value]').on('change', function () {
      var value = $(this).val();
      var itemArray = $(this).data('list-value').split('_');
      var field = $(this).data('list-name');

      if ($(this).is(':checkbox')) {
        value = $(this).is(":checked") ? 1 : 0;
      }

      $.ajax({
        url: urlAjaxHandlerCms + 'update/updateItemField/' + itemArray[0] + '/' + itemArray[1],
        data: {
          model: itemArray[0],
          field: field,
          value: value
        },
        type: "GET",
        dataType: 'json',
        cache: false,
        success: function success(response) {
          //  suppress
          $.notify(response.message, "success");
        },
        error: function error(xhr, _ajaxOptions, thrownError) {
          $.notify("Something went Wrong please" + xhr.responseText + thrownError);
        }
      });
    });
    $('[data-list-boolean]').on('click', function () {
      var itemArray = $(this).data('list-boolean').split('_');
      var field = $(this).data('list-name');
      var onObj = $(this).find(".bool-on");
      var offObj = $(this).find(".bool-off");
      var value = onObj.hasClass('hidden') ? 1 : 0;
      $.ajax({
        url: urlAjaxHandlerCms + 'update/updateItemField/' + itemArray[0] + '/' + itemArray[1],
        data: {
          model: itemArray[0],
          field: field,
          value: value
        },
        type: "GET",
        dataType: 'json',
        cache: false,
        success: function success(response) {
          //  suppress
          onObj.toggleClass('hidden');
          offObj.toggleClass('hidden');
          $.notify(response.message, "success");
        },
        error: function error(xhr, _ajaxOptions, thrownError) {
          $.notify("Something went Wrong please" + xhr.responseText + thrownError);
        }
      });
    });
    $('[data-role="delete-item"]').on('click', function (e) {
      e.preventDefault();
      var curItem = this;
      bootbox.setLocale(_LOCALE);
      bootbox.confirm("<h4>Are you sure?</h4>", function (confirmed) {
        if (confirmed) {
          location.href = curItem.href;
        }
      });
    }); // gestione check box liste

    $('input.checkbox').click(function () {
      if ($("input.checkbox:checked").length > 0) $('#toolbar_deleteButtonHandler').stop().fadeIn();else $('#toolbar_deleteButtonHandler').stop().fadeOut();
    });
    $('#toolbar_editButtonHandler').on('click', function (e) {
      e.preventDefault(); //  redirect to edit page

      location.href = $('#row_' + curItem + ' [data-role="edit-item"] ')[0].href;
    });
    $('#toolbar_deleteButtonHandler').on('click', function (e) {
      e.preventDefault(); //  redirect to edit page

      bootbox.setLocale(_LOCALE);
      bootbox.confirm("<h4>Are you sure?</h4>", function (confirmed) {
        if (confirmed) {
          $('input.checkbox:checked').each(function () {
            $('#row_' + $(this).val()).fadeOut('1000');
            deleteUrl = $('#row_' + $(this).val() + ' [data-role="delete-item"] ')[0].href; // Do delete

            curModel = _CURMODEL;
            $.ajax({
              url: urlAjaxHandlerCms + 'delete/' + curModel + '/' + $(this).val(),
              type: "GET",
              dataType: 'json',
              cache: false,
              error: function error(xhr, _ajaxOptions, thrownError) {
                $.notify("Something went Wrong please" + xhr.responseText + thrownError);
              }
            });
          });
          $.notify("Selected items have been deleted");
        }
      });
    });
  }

  function initOverrideInvalid() {
    var offset = $('header').outerHeight() + 30;
    document.addEventListener('invalid', function (e) {
      $(e.target).addClass('invalid');
      $('html, body').animate({
        scrollTop: $($(".invalid")[0]).offset().top - offset
      }, 0);
    }, true);
    document.addEventListener('change', function (e) {
      $(e.target).removeClass('invalid');
    }, true);
  }

  function handleSidebar() {
    $('#sidebar').on('click', function (e) {
      e.stopPropagation();
    });
    $('html, body').on('click', function () {
      $('#sidebar').removeClass('open');
    });
  }

  function createCropper(container, options) {
    return new Cropper(container, options);
  }

  function updateCropper(key, cropper, file_options) {
    var canvas = cropper.getCroppedCanvas(file_options);
    var format = file_options.format || 'jpeg';
    format = 'image/' + format;
    $('#cropper-data-' + key).val(canvas.toDataURL(format));
    $('#cropper-preview-image-' + key).attr('src', canvas.toDataURL(format));
    $('#cropper-filename-' + key).val(cropper.uploadedImageName);
  }

  function updateMediaContainers(response) {
    var mediaType = response.data;
    var mediaObjContaner = mediaType == 'images' ? "#simpleGallery" : "#simpleDocGallery";
    $(mediaObjContaner).load(urlAjaxHandlerCms + 'updateHtml/' + mediaType + '/' + _CURMODEL + '/' + $('#itemId').val());
  }

  return {
    init: function init() {
      handleBootstrap(); //handleIEFixes();

      listHandler();
      handleFlashMessage();
      handleToggle();
      handleSidebar();
      initCheckboxes();
      initOverrideInvalid();
    },
    initDatePicker: function initDatePicker() {
      $(".datepicker").datepicker({
        dateFormat: "dd-mm-yy"
      });
    },
    initUploadifiveSingle: function initUploadifiveSingle() {
      $('.file_upload_single').each(function () {
        var elem = $(this);
        elem.uploadifive({
          'auto': true,
          //'checkScript'      : 'check-exists.php',
          'queueID': 'queue_' + elem.data('key'),
          'uploadScript': urlAjaxHandlerCms + 'uploadifiveSingle',
          'onAddQueueItem': function onAddQueueItem() {
            this.data('uploadifive').settings.formData = {
              'timestamp': '1451682058',
              'token': '4b9fe8f26d865150e4b26b2a839d4f2b',
              'Id': $('#itemId').val(),
              'myImgType': $('#myImgType').val(),
              'model': _CURMODEL,
              'key': elem.data('key'),
              "_token": $('[name=_token]').val()
            };
          },
          'onUploadComplete': function onUploadComplete(_file, data) {
            var responseObj = jQuery.parseJSON(data);
            var filename = responseObj.filename;
            $('[name="' + elem.data('key') + '"]').val(filename);
          }
        });
      });
    },
    initUploadifiveMedia: function initUploadifiveMedia() {
      var elem = $('#file_upload_media');
      elem.uploadifive({
        'auto': true,
        //'checkScript'      : 'check-exists.php',
        'queueID': 'queue_media',
        'uploadScript': urlAjaxHandlerCms + 'uploadifiveMedia',
        'onAddQueueItem': function onAddQueueItem() {
          this.data('uploadifive').settings.formData = {
            'timestamp': '1451682058',
            'token': '4b9fe8f26d865150e4b26b2a839d4f2b',
            'Id': $('#itemId').val(),
            'myImgType': $('#myImgType').val(),
            'model': _CURMODEL,
            'key': elem.data('key'),
            "_token": $('[name=_token]').val()
          };
        },
        'onUploadComplete': function onUploadComplete(_file, data) {
          var responseObj = jQuery.parseJSON(data);

          if (responseObj.status == 'ko') {
            alert(responseObj.error);
            var errorHtml = "<span style =\"color:red\"> ".concat(responseObj.error, "</span>");
            $('.fileinfo').html(errorHtml);
          } else {
            updateMediaContainers(responseObj);
          }
        }
      });
    },
    initTinymce: function initTinymce() {
      tinymce.init({
        selector: "textarea.wyswyg",
        plugins: ["advlist autolink lists link image charmap print preview anchor textcolor colorpicker", "searchreplace visualblocks code fullscreen", "insertdatetime media table contextmenu paste hr pagebreak"],
        pagebreak_split_block: true,
        branding: false,
        statusbar: false,
        height: 200,
        toolbar: "insertfile undo redo | styleselect | bold italic | bullist numlist outdent indent | link | code"
      });
    },
    initColorPicker: function initColorPicker() {
      $('.color-picker').colorpicker({
        'format': 'hex'
      });
    },
    initFiles: function initFiles() {
      var inputs = $('.form-file').find('input[type="file"]');
      inputs.each(function () {
        var elem = $(this),
            label = elem.siblings('label').first();
        elem.on('change', function () {
          Cms.updateFile(elem, label);
        });
        elem.on('focus', function () {
          elem.addClass('has-focus');
        });
        elem.on('blur', function () {
          elem.removeClass('has-focus');
        });
      });
    },
    updateFile: function updateFile(elem, label) {
      var fileName = '';
      files = elem[0].files;
      if (files && files.length > 1) fileName = (elem.data('selected-caption') || '').replace('{count}', files.length);else fileName = elem.val().split('\\').pop();
      if (fileName) label.html(fileName);else label.html(elem.data('empty-caption'));
    },
    initSortableList: function initSortableList(object) {
      $(object).sortable({
        revert: true,
        items: "li:not(.sort-disabled)",
        update: function update() {
          var order = $(object).sortable('serialize');
          $("#info").load(urlAjaxHandlerCms + "updateMediaSortList?" + order);
        }
      });
      $("ul#simpleGallery").disableSelection();
    },
    initImageRelationList: function initImageRelationList() {
      $('[data-image-relation]').on('click', function () {
        var targetField = $(this).data('image-relation');
        var targetFieldValue = $(this).data('image-id');
        $("#" + targetField).val(targetFieldValue);
        $('[data-image-relation="' + targetField + '"]').each(function () {
          $(this).removeClass('active');
          $(this).addClass('inactive');
        });
        $(this).addClass('active');
      });
    },
    initMediaModal: function initMediaModal() {
      $(document).on('submit', '#media-edit-form', function (ev) {
        ev.preventDefault();
        var fields = $(this).serializeArray();
        var fields_object = {};
        $.each(fields, function (_i, v) {
          fields_object[v['name']] = v['value'];
        });
        if ($('#media_category_id option:selected').val()) media_category_title = $('#media_category_id option:selected').text();else media_category_title = '';
        $.ajax({
          type: 'POST',
          dataType: 'json',
          url: $(this).attr('action'),
          data: $(this).serialize(),
          success: function success(response) {
            var errorsHtml = '<div class="alert alert-info"><ul>';
            errorsHtml += '<li>' + response.status + '</li>'; //showing only the first error.

            errorsHtml += '</ul></div>';
            $('#errorBox').html(errorsHtml);
            var id = '#box_media_' + fields_object.id;
            $(id + ' .media-title').text(fields_object.title);
            $(id + ' .media-category').text(media_category_title);
          },
          error: function error(data) {
            var errors = data.responseJSON;
            var errorsHtml = '<div class="alert alert-danger"><ul>';
            $.each(errors, function (_key, value) {
              errorsHtml += '<li>' + value[0] + '</li>'; //showing only the first error.
            });
            errorsHtml += '</ul></div>';
            $('#errorBox').html(errorsHtml);
          }
        });
      });
    },
    initDateTimePicker: function initDateTimePicker() {
      $('.datetimepicker').datetimepicker({
        controlType: 'select',
        oneLine: true,
        dateFormat: 'dd-mm-yy',
        timeFormat: 'HH:mm:ss',
        hourMin: 6,
        hourMax: 22
      });
    },
    deleteImages: function deleteImages(obj) {
      bootbox.setLocale(_LOCALE);
      bootbox.confirm("<h4>Are you sure?</h4>", function (confirmed) {
        var curItem = obj;
        var value = "";
        var itemArray = curItem.id.split('-');
        var field = itemArray[1];
        var boxObj = $("#box_" + itemArray[1] + "_" + itemArray[2]);

        if (confirmed) {
          $.ajax({
            url: urlAjaxHandlerCms + 'update/updateItemField/' + _CURMODEL + '/' + itemArray[2],
            data: {
              model: _CURMODEL,
              field: field,
              value: value
            },
            type: "GET",
            dataType: 'json',
            cache: false,
            success: function success(response) {
              // set input value as null
              $('input[name=' + itemArray[1] + ']').val(''); //  suppress

              $.notify(response.message, "success"); // hide  the   media  preview  container

              boxObj.hide();
            },
            error: function error(xhr, _ajaxOptions, thrownError) {
              $.notify("Something went Wrong please" + xhr.responseText + thrownError);
            }
          });
        }
      });
    },
    deleteItem: function deleteItem(obj) {
      bootbox.setLocale(_LOCALE);
      bootbox.confirm("<h4>Are you sure?</h4>", function (confirmed) {
        var curItem = obj;
        var itemArray = curItem.id.split('_');
        var boxObj = $("#box_" + itemArray[1] + "_" + itemArray[2]);

        if (confirmed) {
          $.ajax({
            url: urlAjaxHandlerCms + 'delete/' + itemArray[1] + '/' + itemArray[2],
            type: "GET",
            dataType: 'json',
            cache: false,
            success: function success(response) {
              //  suppress
              $.notify(response.message, "success"); // hide  the   media  preview  container

              boxObj.hide();
            },
            error: function error(xhr, _ajaxOptions, thrownError) {
              $.notify("Something went Wrong please" + xhr.responseText + thrownError);
            }
          });
        }
      });
    },
    initCropper: function initCropper(key, cropper_options, file_options) {
      var container = document.getElementById('cropper-container-' + key);
      var cropper = createCropper(container, cropper_options);
      $('#cropper-upload-' + key).on('change', function () {
        var files = this.files;

        if (cropper && files && files.length) {
          var file = files[0];

          if (/^image\/(png|jpeg|gif)/.test(file.type)) {
            if (cropper.uploadedImageURL) {
              URL.revokeObjectURL(cropper.uploadedImageURL);
            }

            $('#cropper-toolbar-' + key).addClass('visible');
            container.src = URL.createObjectURL(file);
            cropper.destroy();
            cropper = createCropper(container, cropper_options);
            cropper.uploadedImageType = file.type;
            cropper.uploadedImageName = file.name;
            cropper.uploadedImageURL = container.src;
          } else {
            window.alert('Please choose an image file.');
          }
        } else {
          $('#cropper-toolbar-' + key).removeClass('visible');
        }
      });
      $('#cropper-zoom-in-' + key).on('click', function (e) {
        e.preventDefault();

        if (cropper) {
          cropper.zoom(0.1); // there is no zoom end event to call this with

          setTimeout(function () {
            updateCropper(key, cropper, file_options);
          }, 100);
        }
      });
      $('#cropper-zoom-out-' + key).on('click', function (e) {
        e.preventDefault();

        if (cropper) {
          cropper.zoom(-0.1); // there is no zoom end event to call this with

          setTimeout(function () {
            updateCropper(key, cropper, file_options);
          }, 100);
        }
      });
      $('#cropper-save-' + key).on('click', function (e) {
        e.preventDefault();

        if (cropper) {
          updateCropper(key, cropper, file_options);
          $.ajax({
            url: urlAjaxHandlerCms + 'cropperMedia',
            type: 'POST',
            data: {
              id: $('#itemId').val(),
              image: $('#cropper-data-' + key).val(),
              filename: $('#cropper-filename-' + key).val(),
              myImgType: $('#myImgType').val(),
              model: _CURMODEL,
              _token: Laravel.csrfToken
            }
          }).done(function (response) {
            updateMediaContainers(response);
            cropper.destroy();
            container.src = '';
            $('#cropper-upload-' + key).val('').trigger('change');
          }).fail(function (xhr, _ajaxOptions, thrownError) {
            $.notify("Something went Wrong please" + xhr.responseText + thrownError);
          });
        }
      });
      container.addEventListener('cropend', function () {
        updateCropper(key, cropper, file_options);
      });
      container.addEventListener('ready', function () {
        updateCropper(key, cropper, file_options);
      });
    }
  };
}();

/***/ }),

/***/ 1:
/*!******************************************!*\
  !*** multi ./resources/assets/js/cms.js ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! D:\wamp64\www\cms\resources\assets\js\cms.js */"./resources/assets/js/cms.js");


/***/ })

/******/ });