# import xml.etree.ElementTree as et
import yaml
import xml.dom.minidom

def add_elements(doc, root, elements, level=0):
    # print()
    # print(' ' * level * 4 + str(elements))
    for a in elements:
        # print(' ' * level * 4 + '-->', a)
        child = doc.createElement(a['name'])

        if 'attrs' in a:
            for key, value in a['attrs'].items():
                # print(' ' * level * 4 + a['name'], str(key) + '=' + str(value))
                child.setAttribute(key, str(value))

        if 'text' in a:
            child.appendChild(doc.createTextNode(a['text']))

        if 'children' in a:
            add_elements(doc, child, a['children'], level=level+1)

        root.appendChild(child)

if __name__ == '__main__':
    print('+++ generating .cproject ...')
    doc = xml.dom.minidom.Document()
    doc.encoding='UTF-8'

    version_declaration = doc.createProcessingInstruction('fileVersion', '4.0.0')
    doc.appendChild(version_declaration)

    with open('cproject-4.0.0-min.yml', 'r') as elements_file:
        elements = yaml.load(elements_file)

    add_elements(doc, doc, elements['root'])

    doc.writexml(open('.cproject', 'w'), indent='', addindent='\t', newl='\n', encoding='UTF-8" standalone="no')
    doc.unlink()
