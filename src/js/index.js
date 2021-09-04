'use strict'
const openModalClassList = document.querySelectorAll('.modal-open')
const closeModalClassList = document.querySelectorAll('.modal-close')
const overlay = document.querySelector('.modal-overlay')
const body = document.querySelector('body')
const modal = document.querySelector('.modal')
const modalInnerHTML = document.getElementById('modalInner')

for (let i = 0; i < openModalClassList.length; i++) {
    openModalClassList[i].addEventListener('click', (e) => {
        // form要素に送信先が指定されていない場合、現在のURLに対してフォームの内容を送信するのを阻止。
        e.preventDefault()
        let eventId = parseInt(e.currentTarget.id.replace('event-', ''))
        openModal(eventId)
        console.log(eventId);
    }, false)
}

for (var i = 0; i < closeModalClassList.length; i++) {
    closeModalClassList[i].addEventListener('click', closeModal)
}

overlay.addEventListener('click', closeModal)

async function openModal(eventId) {
    try {
        const url = '/api/getModalInfo.php?eventId=' + eventId
        const res = await fetch(url)
        const event = await res.json()
        let modalHTML = `
      <h2 class="text-md font-bold mb-3">${event.name}</h2>
      <p class="text-sm">${event.date}（${event.day_of_week}）</p>
      <p class="text-sm">${event.start_at} ~ ${event.end_at}</p>

      <hr class="my-4">

      <p class="text-md">
        ${event.message}
      </p>    `
        switch (0) {
            case 0:
                modalHTML += `
                <form action="/manage/eventadd/eventform.php/?id=1">
                    <div class="flex mt-5">
                        <input type='submit' name="status_id" value="編集する" class="flex-1 bg-blue-500 py-2 mx-3 rounded-3xl text-white text-lg font-bold"
                        <input type="hidden" name="event_id" value="<?= $genre_content['id'] ?>">
                    </div>
                </form>

                <form action="/manage/eventadd/eventform.php">
                    <div class="flex mt-5">
                        <input type='submit' name="status_id" value="削除する" class="flex-1 bg-blue-500 py-2 mx-3 rounded-3xl text-white text-lg font-bold">
                    </div>
                </form>
        `
                break;
            case 1:
                modalHTML += `
          <div class="text-center mt-10">
            <p class="text-xl font-bold text-gray-300">編集</p>
          </div>
        `
                break;
            case 2:
                modalHTML += `
          <div class="text-center mt-10">
            <p class="text-xl font-bold text-green-400">参加</p>
          </div>
        `
                break;
        }
        modalInnerHTML.insertAdjacentHTML('afterbegin', modalHTML)
    } catch (error) {
        console.log(error)
    }
    toggleModal()
}

function closeModal() {
    modalInnerHTML.innerHTML = ''
    toggleModal()
}

function toggleModal() {
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    body.classList.toggle('modal-active')
}

async function participateEvent(eventId) {
    try {
        let formData = new FormData();
        formData.append('eventId', eventId)
        const url = '/api/postEventAttendance.php'
        await fetch(url, {
            method: 'POST',
            body: formData
        }).then((res) => {
            if (res.status !== 200) {
                throw new Error("system error");
            }
            return res.text();
        })
        closeModal()
        location.reload()
    } catch (error) {
        console.log(error)
    }
}