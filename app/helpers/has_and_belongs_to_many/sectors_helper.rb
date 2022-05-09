module HasAndBelongsToMany::SectorsHelper
    def getSectorsIndustries
        appointment = "<h2>Industries Details</h2>
            <div>
            <table class='table'>
            <thead class='thead-dark'>
                <tr>
                <th scope='col'>#</th>
                <th scope='col'>Physician Name</th>
                <th scope='col'>Patient Name</th>
                <th scope='col'>Apointment Date</th>
                
                </tr>
            </thead>
            <tbody>
                #{render @sector.industries}   
            </tbody>
            </table>
            </div>"
    end

    def getIndustries
        industries = Industry.all
        industries.map{|industry| [industry.name,industry.id]}
    end
end
