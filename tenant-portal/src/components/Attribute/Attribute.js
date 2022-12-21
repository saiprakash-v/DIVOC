import {useTranslation} from "react-i18next";

function Attribute(props) {

    const { t } = useTranslation();
    const attributeTypes = [
        {"label": "Text", "value":"string"},
        {"label": "Number", "value":"integer"},
        {"label": "Date/Time", "value":"date"}
    ]
    return(
        <tr>
            <td>
                {
                    props.schemaAttribute.editMode ? 
                        <input type="text" defaultValue={props.schemaAttribute.label} /> : props.schemaAttribute.label 
                }
            </td>
            <td>
                {
                    props.schemaAttribute.editMode ? 
                        <select defaultValue={props.schemaAttribute.type}>
                            {
                                attributeTypes.map(function(attributeType) {
                                    return <option value={attributeType.value}>{attributeType.label}</option>
                                })
                            }
                        </select> : props.schemaAttribute.type 
                }
            </td>
            <td className="text-center">
                <input type="checkbox" id="mandatoryAttribute" name="mandatoryAttribute" checked={props.schemaAttribute.isMandatory}/>
            </td>
            <td className="text-center">
                <input type="checkbox" id="indexedAttribute" name="indexedAttribute" checked={props.schemaAttribute.isIndexField}/>
            </td>
            <td className="text-center">
                <input type="checkbox" id="uniqueAttribute" name="uniqueAttribute" checked={props.schemaAttribute.isUniqueIndex}/>
            </td>
            <td>
                {
                    props.schemaAttribute.editMode ? 
                        <input type="text" defaultValue={props.schemaAttribute.description} /> : props.schemaAttribute.description 
                }
            </td>
        </tr>
    );
}

export default Attribute;