$ ->
  $.getJSON '/tags.json', (tag2paths)->
    
    model =
      show_links_for_tag: (m, evt)->
        tag = $(evt.target).data("tag")
        this.links_shown true
        this.links tag2paths[tag]
      links: ko.observableArray []
      links_shown: ko.observable true

    ko.applyBindings model
    console.log "binded"
