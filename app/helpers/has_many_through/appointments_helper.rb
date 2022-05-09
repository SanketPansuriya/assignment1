module HasManyThrough::AppointmentsHelper
    def getPhysicians
        physicians = Physician.all
        physicians.map{|physician| [physician.name,physician.id]}
    end

    def getPatients
        patients = Patient.all
        patients.map{|patient| [patient.name,patient.id]}
    end
end
