require_relative 'inferno_template/allergyIntolerance_group'
require_relative 'inferno_template/bundle_group'
require_relative 'inferno_template/careplan_group'
require_relative 'inferno_template/careteam_group'
require_relative 'inferno_template/composition_group'
require_relative 'inferno_template/condition_group'
require_relative 'inferno_template/coverage_group'
require_relative 'inferno_template/device_group'
require_relative 'inferno_template/diagnosticReport_group'
require_relative 'inferno_template/documentReference_group'
require_relative 'inferno_template/encounter_group'
require_relative 'inferno_template/goal_group'
require_relative 'inferno_template/imagingStudy_group'
require_relative 'inferno_template/immunization_group'
require_relative 'inferno_template/location_group'
require_relative 'inferno_template/media_group'
require_relative 'inferno_template/medication_group'
require_relative 'inferno_template/medicationDispense_group'
require_relative 'inferno_template/medicationRequest_group'
require_relative 'inferno_template/medicationStatement_group'
require_relative 'inferno_template/messageHeader_group'
require_relative 'inferno_template/observation_group'
require_relative 'inferno_template/organization_group'
require_relative 'inferno_template/patient_group'
require_relative 'inferno_template/practitioner_group'
require_relative 'inferno_template/practitionerRole_group'
require_relative 'inferno_template/procedure_group'
require_relative 'inferno_template/provenance_group'
require_relative 'inferno_template/questionnaireResponse_group'
require_relative 'inferno_template/relatedPerson_group'
require_relative 'inferno_template/serviceRequest_group'
require_relative 'inferno_template/specimen_group'

module InfernoTemplate
  class Suite < Inferno::TestSuite
    id :inferno_template_test_suite
    title 'TW Core v0.3.1'
    description 'TW Core FHIR API'

    # These inputs will be available to all tests in this suite
    input :url,
      title: 'FHIR Server Base Url',
      default: 'https://twcore.hapi.fhir.tw/fhir/'

    # input :credentials,
    #       title: 'OAuth Credentials',
    #       type: :oauth_credentials,
    #       optional: true

    # All FHIR requests in this suite will use this FHIR client
    fhir_client do
      url :url
      # oauth_credentials :credentials
    end

    # All FHIR validation requsets will use this FHIR validator
    fhir_resource_validator do
      # igs 'identifier#version' # Use this method for published IGs/versions
      igs 'igs/package.tgz'   # Use this otherwise
      # igs 'igs/package'

      exclude_message do |message|
        message.message.match?(/\A\S+: \S+: URL value '.*' does not resolve/)
      end
    end

    group do
      id :tw_core_fhir_api
      title 'TW Core FHIR API'
      description 'Group containing all TW Core FHIR API tests'

      # These inputs will be available to all tests in this suite
      # input :url,
      # title: 'FHIR Server Base Url'

      # input :credentials,
      # title: 'OAuth Credentials',
      # type: :oauth_credentials,
      # optional: true

      # # All FHIR requests in this suite will use this FHIR client
      # fhir_client do
      # url :url
      # oauth_credentials :credentials
      # end

      # Tests and TestGroups can be defined inline
      group do
        id :capability_statement
        title 'Capability Statement'
        description 'Verify that the server has a CapabilityStatement'

        test do
          id :capability_statement_read
          title 'Read CapabilityStatement'
          description 'Read CapabilityStatement from /metadata endpoint'

          run do
            fhir_get_capability_statement

            assert_response_status(200)
            assert_resource_type(:capability_statement)
          end
        end
      end

      # Tests and TestGroups can be written in separate files and then included
      # using their id
      group from: :allergyIntolerance_group
      group from: :bundle_group
      group from: :carePlan_group
      group from: :careTeam_group
      group from: :composition_group
      group from: :condition_group
      group from: :coverage_group
      group from: :device_group
      group from: :diagnosticReport_group
      group from: :documentReference_group
      group from: :encounter_group
      group from: :goal_group
      group from: :imagingStudy_group
      group from: :immunization_group
      group from: :location_group
      group from: :media_group
      group from: :medication_group
      group from: :medicationDispense_group
      group from: :medicationRequest_group
      group from: :medicationStatement_group
      group from: :messageHeader_group
      group from: :observation_group
      group from: :organization_group
      group from: :patient_group
      group from: :practitioner_group
      group from: :practitionerRole_group
      group from: :procedure_group
      group from: :provenance_group
      group from: :questionnaireResponse_group
      group from: :relatedPerson_group
      group from: :serviceRequest_group
      group from: :specimen_group
    end
  end
end
