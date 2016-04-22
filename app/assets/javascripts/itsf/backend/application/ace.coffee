$ ->
  $("textarea[data-add-editor='true']").each ->
    textarea = @

    # Create css id based on the text area id
    div_id = "editor_for_#{$(textarea).attr('id')}"

    # Add editor div
    $(textarea).after("<div id=\"#{div_id}\" class=\"editor\">#{$(textarea).val()}</div>")

    # Hide textarea
    $(textarea).css('display', 'none');

    # Add editor
    editor = ace.edit("#{div_id}")

    # Set syntax highlighting
    if $(textarea).is('[data-editor-syntax]')
      syntax = $(textarea).attr('data-editor-syntax')
      editor.session.setMode("ace/mode/#{syntax}");

    # On change, copy content to the textarea
    editor.on('input', ->
      $(textarea).val(editor.getValue())
    )
    
$ ->
  $("pre[data-add-editor='true']").each ->
    container = @

    # Create css id based on the container id
    div_id = "editor_for_#{$(container).attr('id')}"

    # Add editor div
    $(container).after("<div id=\"#{div_id}\" class=\"editor\">#{$(container).html()}</div>")

    # Hide container
    $(container).css('display', 'none');

    # Add editor
    editor = ace.edit("#{div_id}")

    # editor.setValue($(container).html())

    # Set syntax highlighting
    if $(container).is('[data-editor-syntax]')
      syntax = $(container).attr('data-editor-syntax')
      editor.session.setMode("ace/mode/#{syntax}");

    # Set the editor to read-only
    editor.setReadOnly(true)