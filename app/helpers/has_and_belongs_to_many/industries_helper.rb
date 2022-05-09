module HasAndBelongsToMany::IndustriesHelper
  def getIndustrySectors
    appointment = "
      <h2>Sector Details</h2>
      <div>
      <table class='table'>
      <thead class='thead-dark'>
        <tr>
          <th scope='col'>#</th>
          <th scope='col'>Sector Name</a></th>
        
        </tr>
      </thead>
      <tbody>
          #{render @industry.sectors}   
      </tbody>
      </table>
      </div>
    "
  end

  def getSectors
    sectors = Sector.all
    sectors.map{|sector| [sector.name,sector.id]}
  end
end
