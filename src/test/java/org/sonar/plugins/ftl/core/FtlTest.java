/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.core;

import org.junit.Test;
import org.sonar.api.config.Settings;
import org.sonar.plugins.ftl.api.FtlConstants;

import static org.fest.assertions.Assertions.assertThat;

/**
 * @author Matthijs Galesloot
 */
public class FtlTest {

  @Test
  public void testDefaultFileSuffixes() {
    Ftl ftl = new Ftl(new Settings());
    assertThat(ftl.getFileSuffixes()).containsOnly("ftl");
  }

  @Test
  public void testCustomFileSuffixes() {
    Settings settings = new Settings();
    settings.appendProperty(FtlConstants.FILE_EXTENSIONS_PROP_KEY, "foo, bar ,   toto");
    Ftl ftl = new Ftl(settings);
    assertThat(ftl.getFileSuffixes()).containsOnly("foo", "bar", "toto");
  }

}
