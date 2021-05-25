module ApplicationHelper
    def display_roles roles_hash
        tags = html_escape('')
        roles_hash.each do |key, value|
            tags << content_tag(:span, key, class: 'badge rounded-pill bg-primary') if value
        end
        tags
    end
end
