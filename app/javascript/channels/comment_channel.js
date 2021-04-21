import consumer from "./consumer"

$(document).on('turbolinks:load', () => {
    $('[data-channel-subscribe="project"]').each(function(index, element) {
        var $element = $(element),
            $chatList = $('#comment-list'),
            $form = $('#new-comment'),
            project_id = $element.data('project-id')

        consumer.subscriptions.create(
            {
                channel: "CommentChannel",
                project: project_id
            },
            {
                received: function(data) {
                    console.log(data.message)
                    $chatList.append(data.message)

                    $form[0].reset();
                    $chatList.animate({ scrollTop: $chatList.prop("scrollHeight") }, 1000)
                }
            }
        )
    });
});