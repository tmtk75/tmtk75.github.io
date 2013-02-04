$ ->
  $.getJSON '/tags.json', (tag2paths)->
    
    model =
      show_links_for_tag: (m, evt)->
        tag = $(evt.target).data("tag")
        console.log tag2paths[tag]
        this.links_shown true
        this.links tag2paths[tag]
      links: ko.observableArray [{title:"test value", path:"none"}]
      links_shown: ko.observable true
      varname:
        title: "foobar"

    ko.applyBindings model
    console.log "binded"
