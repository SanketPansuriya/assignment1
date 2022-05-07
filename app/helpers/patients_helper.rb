module PatientsHelper

    def getApointmentPatient 
        appointment = "<h2>Apointment Details</h2>
            <div>
            <table class='table'>
            <thead class='thead-dark'>
                <tr>
                <th scope='col'>#</th>
                <th scope='col'>Physician Name</th>
                <th scope='col'>Patient Name</th>
                <th scope='col'>Email</th>
                <th scope='col'>Action</th>
                
                </tr>
            </thead>
            <tbody>
                #{render @patient.appointments}   
            </tbody>
            </table>
            </div>"
    end
end
