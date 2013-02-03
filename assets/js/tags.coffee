$ ->
  $.getJSON '/tags.json', (tag2paths)->
    model =
      show_links_for_tag: (m, evt)->
        tag = $(evt.target).data("tag")
        console.log "show_links_for_tag", tag
        console.log tag2paths[tag]
    ko.applyBindings model

