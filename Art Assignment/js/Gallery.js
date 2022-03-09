const handleTag = (el) => {
    const isOpen = el?.dataset?.open == 'true'
    const imageEl = el?.querySelector('.gallery-tag-chevron')

    if (!isOpen) {
        imageEl?.classList?.add('rotate-90')
        el?.nextElementSibling?.classList?.remove('max-h-0')
        el?.nextElementSibling?.classList?.add('mb-2', 'max-h-[1000px]')

        el.dataset.open = 'true'
    } else {
        imageEl?.classList?.remove('rotate-90')
        el?.nextElementSibling?.classList?.add('max-h-0')
        el?.nextElementSibling?.classList?.remove('mb-2', 'max-h-[1000px]')

        el.dataset.open = 'false'
    }
}