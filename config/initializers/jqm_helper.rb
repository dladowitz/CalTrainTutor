module JqmHelper

  # extracts object from hash and uses class name and id in data-attributes
  def jqm_page(title, options = {}, &block)
    defaults = {
        class: "#{title.downcase}_page",
        id: "#{title.downcase}_page",
        data: {
            role: 'page',
            title: title.capitalize,
            url: request.url
        }
    }


    if object = options.delete(:object).presence
      defaults[:data][object.class.name.to_sym] = object.id
    end

    script = ''

    #session.delete('load_resource') { [] }.each do |name, resource|
    #  o = {}
    #  logger.warn "loading resource: #{name}, #{resource.last}. #{resource.first}"
    #  o[name] = resource.first.where({_id: resource.last})
    #  script << "window.load_resource(#{resource.to_json}');\n"
    #end

    # todo: assets version gemified
    content_tag(:div, raw(%Q{
                  <meta name="assets_version" content="#{CaltrainTutor::Application.config.assets.version}"/>
                  #{csrf_meta_tags}
                  <!--<script type='text/javascript'>#{script}</script>-->
                  #{capture(&block)}
                          }), make_options(defaults, options))
  end
end