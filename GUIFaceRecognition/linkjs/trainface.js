function add_face(){
  const {PythonShell} = require('python-shell');
  var path = require("path");
  var name = document.getElementById("person").value
  console.log(name);

  var options = {
    scriptPath : path.join(__dirname, '/../'),
    mode: 'text',
    encoding: 'utf8',
    pythonPath: '/usr/bin/python3',
    pythonOptions: ['-u'], // get print results in real-time
    args : [name]
  };
  console.log(options);
  var face = new PythonShell("training_face.py", options);
  swal("Training Face", "Please start turning slowly. Press 's' to save or 'c' to cancel adding this new user to the dataset", "warning")
  console.log(face);

  face.end(function(err, code, message) {
    Swal({
      title: 'Add New Face?',
      text: 'If you click "No", you will be redirected to Home',
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, Add New Face',
      cancelButtonText: 'No'
    }).then((result) => {
      if (result.value) {
        Swal(
          'Add New Face',
          'Training New Face',
          'success'
        )
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        window.location.href = "index.html";
      }
});

  })

}
