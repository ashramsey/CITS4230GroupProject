module ChatroomsHelper
  def js_to_be_included
   # %{
  #    <script type="text/javascript">
  #// this allows jquery to be called along with scriptaculous and YUI without any conflicts
  #// the only difference is all jquery functions should be called with $j instead of $
  #// e.g. $j('#div_id').stuff instead of $('#div_id').stuff
  #      var $j = jQuery.noConflict();
  #    </script>
  #    <script>

   #     function reset_form()
    #    {
     #     document.getElementById('new_entry').reset();
      #    document.getElementById('message_field').focus();
       # }
     # </script>
   # }
  end
end
