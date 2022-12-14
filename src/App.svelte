<script lang="ts">
  import profileImg from './assets/profile.jpeg';
  import haydenMp3 from './assets/hayden.mp3';
  import koumeMp3 from './assets/koume.mp3';
  import yakisobaMp3 from './assets/yakisoba.mp3';
  import Icon from 'svelte-awesome';
  import { arrowUp } from 'svelte-awesome/icons';
  const showContent = (id: string) => {
    document.querySelectorAll('.content').forEach((content) => {
      content.classList.add('hidden');
    });
    document.querySelector(`.content-${id}`).classList.remove('hidden');
    window.scrollTo(0, document.body.scrollHeight);
  };
  const scrollToTop = () => {
    window.scrollTo(0, 0);
  };
</script>

<main>
  <article>
    <section class="panel panel-left">
      <div>
        <nav>
          <span on:click={() => showContent('about')} on:keypress>About</span>
          <span on:click={() => showContent('projects')} on:keypress
            >Projects</span
          >
          <span on:click={() => showContent('music')} on:keypress>Music</span>
          <span on:click={() => showContent('art')} on:keypress>Artwork</span>
        </nav>
        <figure>
          <img src={profileImg} alt="profile" />
        </figure>
      </div>
    </section>
    <section class="panel panel-right">
      <div>
        <article class="content content-about">
          <div>my name is justin kaitaku takeda<span>👋</span></div>
          <div>software engineer based in la<span>🐱‍💻</span></div>
          <div>enjoy surfing and outdoor rec<span>🏄‍♂️⛺</span></div>
          <div>occasionally write music<span>🎹</span></div>
          <div>occasional artist<span>🧑‍🎨</span></div>
        </article>
        <article class="content content-projects hidden">
          <div>
            <a
              href="https://qe-mgr-yew.fly.dev/"
              target="_blank"
              rel="noreferrer">mgmt app built in rust/yew</a
            >
          </div>
          <div>
            <a
              href="https://qe-mgr-svelte.fly.dev/"
              target="_blank"
              rel="noreferrer">another mgmt app built in svelte</a
            >
          </div>
          <div>
            <a
              href="https://github.com/katakeda/boardhop-api-service-go"
              target="_blank"
              rel="noreferrer">api written in golang</a
            >
          </div>
          <div>
            <a
              href="https://github.com/katakeda/boardhop-app-next"
              target="_blank"
              rel="noreferrer">nextjs app with tailwindcss</a
            >
          </div>
          <div>
            <a
              href="https://github.com/katakeda/lantrn-backend"
              target="_blank"
              rel="noreferrer">backend in python/flask</a
            >
          </div>
        </article>
        <article class="content content-music hidden">
          <div>
            <figure>
              <figcaption>Hayden</figcaption>
              <audio controls src={haydenMp3} />
            </figure>
          </div>
          <div>
            <figure>
              <figcaption>Koume House</figcaption>
              <audio controls src={koumeMp3} />
            </figure>
          </div>
          <div>
            <figure>
              <figcaption>Yakisoba</figcaption>
              <audio controls src={yakisobaMp3} />
            </figure>
          </div>
        </article>
        <article class="content content-art hidden">
          <div>
            {#each [...Array(25).keys()] as _}
              <figure>
                <img src={profileImg} alt="art" />
              </figure>
            {/each}
          </div>
        </article>
        <nav class="mobile-nav">
          <button on:click={scrollToTop}><Icon data={arrowUp} /></button>
        </nav>
      </div>
    </section>
  </article>
</main>

<style lang="scss">
  $screen-md: 768px;
  main {
    display: flex;
    background-color: #f2f2f2;
    :global {
      font-family: sans-serif;
    }
    > article {
      width: 100%;
      padding: 16px;
      height: calc(100vh - 32px);
      @media (min-width: $screen-md) {
        display: flex;
      }
    }
  }
  .panel {
    display: flex;
    height: 100vh;
    @media (min-width: $screen-md) {
      width: 50%;
      height: 100%;
    }
    > div {
      width: 100%;
      margin: 65px 0;
    }
  }
  .panel-left > div {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    @media (min-width: $screen-md) {
      flex-direction: column-reverse;
    }
    > figure {
      margin: 0;
      border: thick double #b8860b;
      background-color: #ffffff;
      box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1),
        0 4px 6px -4px rgb(0 0 0 / 0.1);
      height: 450px;
      max-height: 450px;
      > img {
        width: 100%;
        height: 100%;
      }
    }
    > nav {
      display: flex;
      justify-content: space-evenly;
      width: 100%;
      > span {
        cursor: pointer;
        border-bottom: 1px solid transparent;
        transition: all ease-in-out 0.25s;
        &:hover {
          border-color: #b8860b;
        }
      }
    }
  }
  .panel-right > div {
    position: relative;
    display: flex;
    align-items: center;
    > article {
      position: absolute;
      transition: opacity ease-in-out 0.75s;
      padding: 0 24px;
      > div {
        display: flex;
        align-items: center;
      }
    }
  }
  .content-about > div {
    color: #696969;
    > span {
      font-size: 24px;
      margin-left: 10px;
    }
  }
  .content-projects > div {
    margin-bottom: 5px;
  }
  .content-music > div {
    margin-bottom: 5px;
    > figure {
      margin: 0;
      > figcaption {
        color: #696969;
      }
    }
  }
  .content-art {
    overflow: auto;
    height: 100%;
    > div {
      display: grid !important;
      align-items: unset !important;
      grid-template-columns: repeat(5, minmax(0, 1fr));
      > figure {
        margin: 0;
        > img {
          width: 100%;
          height: 100%;
        }
      }
    }
  }
  .mobile-nav {
    position: absolute;
    bottom: 0;
    display: flex;
    justify-content: center;
    width: 100%;
    @media (min-width: $screen-md) {
      display: none;
    }
    > button {
      cursor: pointer;
      padding: 10px 12px;
      border-radius: 1000px;
      border: 1px solid #b8860b;
      background-color: #b8860b;
      color: #ffffff;
    }
  }
  .hidden {
    opacity: 0;
    visibility: hidden;
  }
</style>
